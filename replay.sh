#!/usr/bin/env bash

# Cursed git log replayer, under CC0 or Unlicense at your option

TAB=$(printf "\t")

declare -a authors
declare -A files
declare -a ignores=(llathasa purplesyringa utk8g)
declare -a ignorefiles=(.mailmap LICENSE UNLICENSE)

while read -r line; do
    case $line in
        "commit "*)
            authors=()
            ;;
        "Author: "*)
            author="${line#* }"
            author_ignored=
            for ignore in "${ignores[@]}"; do
                case $author in
                    *"$ignore"*)
                        author_ignored=yes
                        ;;
                    *)
                        ;;
                esac
            done
            if [[ -z $author_ignored ]]; then
                authors+=("$author")
            fi
            ;;
        *)
            IFS=$TAB read -r -a command <<<"$line"
            case ${command[0]} in
                R*)
                    from="${command[1]}"
                    to="${command[2]}"
                    files["$to"]="${files["$from"]}"
                    unset files["$from"]
                    ;;
                A)
                    file="${command[1]}"
                    files["$file"]=
                    ;&
                M)
                    file="${command[1]}"
                    for author in $authors; do
                        case ${files["$file"]} in
                            *$author*)
                                ;;
                            *)
                                files["$file"]+="$TAB$author"
                                ;;
                        esac
                    done
                    ;;
                D)
                    file="${command[1]}"
                    unset files["$file"]
                    ;;
                *)
                    echo Unknown command ${command[0]}
                    exit 1
                    ;;
            esac
            ;;
    esac
done < <(
    git log --reverse --pretty=medium -M05 --name-status | \
    grep -iE '^commit|^Author:|^    Co-Authored-By:|'"$TAB" | \
    sed -E \
        -e 's/^ *//' \
        -e 's/Co-authored-by/Author/i' \
        -e 's/Author: .*(<.*>)/Author: \1/' | \
    uniq | \
    sed -z 's/commit [^\n]*\nAuthor: [^\n]*\n\n//g'
)

for file in "${ignorefiles[@]}"; do
    unset files["$file"]
done

declare -A toplevels

for file in "${!files[@]}"; do
    case $file in
        '"'*)
            toplevel="$(eval "printf $file")"
            ;;
        *)
            toplevel="$file"
            ;;
    esac
    toplevel="${toplevel%%/*}"
    toplevels["$toplevel"]=

    IFS=$TAB read -r -a authors <<<"${files["$file"]}"
    for author in $authors; do
        case ${toplevels["$toplevel"]} in
            *$author*)
                ;;
            *)
                toplevels["$toplevel"]+="$TAB$author"
                ;;
        esac
    done
done

for toplevel in "${!toplevels[@]}"; do
    authors="${toplevels[$toplevel]}"
    if [[ -z "$authors" ]]; then
        printf '%s\tUnlicense\n' "$toplevel"
    else
        if [[ -z $SHOW_REMAINING ]]; then
            authors=
        fi
        printf '%s\tGPL-2.0-only%s\n' "$toplevel" "$authors"
    fi
done | sort
