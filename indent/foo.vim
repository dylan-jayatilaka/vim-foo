" Vim indent file
" Language:	Foo
" Version:	0.0
" Last Change:	6/8/2014
" Maintainer:	Dylan Jayatilaka <dylan.jayatilaka@#gmail.com>

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

let s:cposet=&cpoptions
set cpoptions&vim

setlocal indentkeys+==~end,=~case,=~if,=~else,=~do,=~where,=~elsewhere,=~select
setlocal indentkeys+==~endif,=~enddo,=~endwhere,=~endselect,=~elseif
setlocal indentkeys+==~type,=~interface,=~forall,=~associate,=~block,=~enum
setlocal indentkeys+==~endforall,=~endassociate,=~endblock,=~endenum
setlocal indentkeys+==~function,=~subroutine
setlocal indentkeys+==~endfunction,=~endsubroutine

setlocal indentexpr=FooGetFreeIndent()
if exists("*FooGetFreeIndent")
  finish
endif

function FooGetIndent(lnum)
  let ind = indent(a:lnum)
  let prevline=getline(a:lnum)
  " Strip tail comment
  let prevstat=substitute(prevline, '!.*$', '', '')
  let prev2line=getline(a:lnum-1)
  let prev2stat=substitute(prev2line, '!.*$', '', '')

  "Indent do loops
    if prevstat =~? '^\s*\(\d\+\s\)\=\s*\(\a\w*\s*:\)\=\s*do\>'
      let ind = ind + &sw
    endif
    if getline(v:lnum) =~? '^\s*\(\d\+\s\)\=\s*end>'
      let ind = ind - &sw
    endif

  "Add a shiftwidth to statements following if, else, else if, case,
  "where, else where, forall, type, interface and associate statements
  if prevstat =~? '^\s*\(case\|else\|else\s*if\|else\s*where\)\>'
	\ ||prevstat=~? '^\s*\(type\|interface\|associate\|enum\)\>'
	\ ||prevstat=~?'^\s*\(\d\+\s\)\=\s*\(\a\w*\s*:\)\=\s*\(forall\|where\|block\)\>'
	\ ||prevstat=~? '^\s*\(\d\+\s\)\=\s*\(\a\w*\s*:\)\=\s*if\>'
     let ind = ind + &sw
    " Remove unwanted indent after logical and arithmetic ifs
    if prevstat =~? '\<if\>' && prevstat !~? '\<then\>'
      let ind = ind - &sw
    endif
    " Remove unwanted indent after type( statements
    if prevstat =~? '^\s*type\s*('
      let ind = ind - &sw
    endif
  endif

  "Indent subroutines and functions
    if prevstat =~? '^\s*subroutine\>' || prevstat =~? '^\s*function\>'
      let ind = ind + &sw
    endif
    if getline(v:lnum) =~? '^\s*contains\>'
          \ ||getline(v:lnum)=~? '^\s*end\s*'
          \ .'\(function\|subroutine\|module\|program\)\>'
      let ind = ind - &sw
    endif

  "Subtract a shiftwidth from else, else if, elsewhere, case, end if,
  " end where, end select, end forall, end interface, end associate,
  " end enum, and end type statements
  if getline(v:lnum) =~? '^\s*\(\d\+\s\)\=\s*'
        \. '\(else\|else\s*if\|else\s*where\|case\|'
        \. 'end\s*\(if\|where\|select\|interface\|'
        \. 'type\|forall\|associate\|enum\)\)\>'
    let ind = ind - &sw
    " Fix indent for case statement immediately after select
    if prevstat =~? '\<select\s\+\(case\|type\)\>'
      let ind = ind + &sw
    endif
  endif

  "First continuation line
  if prevstat =~ '&\s*$' && prev2stat !~ '&\s*$'
    let ind = ind + &sw
  endif
  "Line after last continuation line
  if prevstat !~ '&\s*$' && prev2stat =~ '&\s*$'
    let ind = ind - &sw
  endif

  return ind
endfunction

function FooGetFreeIndent()
  "Find the previous non-blank line
  let lnum = prevnonblank(v:lnum - 1)

  "Use zero indent at the top of the file
  if lnum == 0
    return 0
  endif

  let ind=FooGetIndent(lnum)
  return ind
endfunction

let &cpoptions=s:cposet
unlet s:cposet

" vim:sw=2 tw=130

