echo "Enter string to encode:\n"
no <silent> \rot13 g?G
no <silent> \prepend OEncoded string:<Esc>
no <silent> \print :%print<CR>
