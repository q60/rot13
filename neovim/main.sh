#!/bin/sh
nvim --headless -n -i NONE -u init.vim +so!actions -
#                                                  use stdin as source file
#                                      use `actions` as normal mode commands after reading stdin
#                             use `init.vim` as vimrc file, sourced before reading stdin
#                   disable session information saving to ShaDa
#               disable swap files
#    disable TUI
