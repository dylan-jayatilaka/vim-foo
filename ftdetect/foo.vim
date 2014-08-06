" Detect foo files
autocmd BufNewFile,BufRead *.foo set filetype=foo

" Strip trailing spaces
autocmd BufReadPre,FileReadPre *.foo call StripTrailingWhitespace()
