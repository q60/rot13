#!/usr/bin/jq -nsRrf
# -n: Use manual input
# -s: Drain stdin
# -R: Raw input (as raw string, and not a JSON object)
# -r: Raw output
# -f: Use this file as a filter, useful for shebangs

def rot13_char:
    . as $ch |
    ("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ" | split("")) as $list |
    ($list | index($ch)) as $index |
    if $index == null then
        $ch
    else
        $list[$index + 13]
    end;

def rot13:
    [ . | split("").[] | rot13_char ] |
    join("");

"Enter string to encode:",
# There is actually one input; it's trivial to tweak this code to be a REPL rather than oneshot
foreach inputs as $cur (
    null;
    $cur | rot13 | "Encoded string:\n\(.)"
)
