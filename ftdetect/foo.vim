" Detect foo files
autocmd BufNewFile,BufRead *.foo set filetype=foo

" Strip trailing spaces
autocmd FileType foo call StripTrailingWhitespace()
