" Vim syntax file
" Language:	PTL (for the Python Quixote web application framework)
" Maintainer:	Estienne Swart (estienne@sanbi.ac.za)
" URL: http://www.sanbi.ac.za/~estienne/vim/syntax/ptl.vim
" Updated:	2003-12-02
"
" This syntax file is a standard example of embedding one language within
" another (html) within the Python Template Language, quite similar to the
" example embedding POD comments inside a Perl script.
"
" The standard options to control Python syntax highlighting can be changed in
" python.vim, as necessary
" 

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
runtime! syntax/python.vim
unlet b:current_syntax

syn match ptlKeyword		"\[html\]"
" one extra keyword is required in addition to the standard python keywords

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

HiLink ptlKeyword             Function

delcommand HiLink
endif

syn include @HTML syntax/html.vim
syntax region ptlHTML start=/"""/ end=/"""/ contains=@HTML
syntax region ptlHTML start=/'''/ end=/'''/ contains=@HTML
" syntax region ptlHTML start=/["'].\{0,40\}<\w\{1,40\}/ end=/\w\{1,40\}>["']/ contains=@HTML
" matching the little html buggers in ' or " doesn't seem to work nicely :(
" Stick to triple quotes for now

let b:current_syntax = "ptl"
" vim: ts=8
