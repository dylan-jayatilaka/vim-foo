"uncomment to enable folding of `{...}` and `[...]` blocks
" set foldenable

" syntax on
" setlocal foldmethod=syntax
" set foldlevel=1

" set autoindent shiftwidth=3
"
" Only do these settings when not
" done yet for this buffer
" if exists("b:did_ftplugin")
"  finish
"

let s:cposet=&cpoptions
set cpoptions&vim

" No spell-checking
setlocal nospell

" Formatting and tabs
setlocal expandtab
setlocal shiftwidth=3
setlocal softtabstop=3
setlocal textwidth=70

" Don't do other file type
" settings for this buffer
" let b:did_ftplugin = 1

" Set comments and textwidth
" according to source type
setlocal comments=:!

" Free format allows a textwidth of
" 132 for code but 80 is more usual
setlocal tw=80

" Set commentstring for foldmethod=marker
setlocal cms=!%s

" Set 'formatoptions' to break comment and text lines but allow long lines
setlocal fo+=tcql

setlocal include=^\\c#\\=\\s*include\\s\\+
setlocal suffixesadd+=.foo

" Define patterns for the matchit plugin
if !exists("b:match_words")
  let s:notend = '\%(\<end\s\+\)\@<!'
  let s:notselect = '\%(\<select\s\+\)\@<!'
  let s:notelse = '\%(\<end\s\+\|\<else\s\+\)\@<!'
  let s:notprocedure = '\%(\s\+procedure\>\)\@!'
  let b:match_ignorecase = 1
  let b:match_words =
    \ '(:),' .
    \ '\<select\s*case\>:' . s:notselect. '\<case\>:\<end\s*select\>,' .
    \ s:notelse . '\<if\s*(.\+)\s*then\>:' .
    \ '\<else\s*\%(if\s*(.\+)\s*then\)\=\>:\<end\s*if\>,'.
    \ 'do\s\+\(\d\+\):\%(^\s*\)\@<=\1\s,'.
    \ s:notend . '\<do\>:\<end\s*do\>,'.
    \ s:notelse . '\<where\>:\<elsewhere\>:\<end\s*where\>,'.
    \ s:notend . '\<type\s*[^(]:\<end\s*type\>,'.
    \ s:notend . '\<forall\>:\<end\s*forall\>,'.
    \ s:notend . '\<associate\>:\<end\s*associate\>,'.
    \ s:notend . '\<enum\>:\<end\s*enum\>,'.
    \ s:notend . '\<interface\>:\<end\s*interface\>,'.
    \ s:notend . '\<subroutine\>:\<end\s*subroutine\>,'.
    \ s:notend . '\<function\>:\<end\s*function\>,'.
    \ s:notend . '\<module\>' . s:notprocedure . ':\<end\s*module\>,'.
    \ s:notend . '\<program\>:\<end\s*program\>'
endif

" File filters for :browse e
if has("gui_win32") && !exists("b:browsefilter")
  let b:browsefilter = "Foo Files (*.foo)\t*.foo\n" .
    \ "All Files (*.*)\t*.*\n"
endif

let b:undo_ftplugin = "setl fo< com< tw< cms< et< inc<"
	\ . "| unlet! b:match_ignorecase b:match_words b:browsefilter"

let &cpoptions=s:cposet
unlet s:cposet


