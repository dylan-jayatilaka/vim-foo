au BufNewFile,BufRead *.foo set filetype=foo
au BufWritePre,FileWritePre *.foo call StripTrailingWhitespace()

