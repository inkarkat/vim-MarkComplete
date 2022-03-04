" MarkComplete.vim: Insert mode completion for matches of mark patterns.
"
" DEPENDENCIES:
"
" Copyright: (C) 2022 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_MarkComplete') || (v:version < 700)
    finish
endif
let g:loaded_MarkComplete = 1

"- configuration ---------------------------------------------------------------

if ! exists('g:MarkComplete_EnableBraceMappings')
    let g:MarkComplete_EnableBraceMappings = 1
endif


"- mappings --------------------------------------------------------------------

inoremap <script> <expr> <Plug>(MarkCompleteAll) PatternComplete#PatternExpr(mark#AnyMarkPattern(), 0, 1)
if ! hasmapto('<Plug>(MarkCompleteAll)', 'i')
    imap <C-x># <Plug>(MarkCompleteAll)
endif

if g:MarkComplete_EnableBraceMappings
inoremap <script> <expr> <Plug>(MarkCompleteAllAsBrace) PatternComplete#PatternExpr(mark#AnyMarkPattern(), 0, 1, 'PatternComplete#AsBrace#Converter')
if ! hasmapto('<Plug>(MarkCompleteAllAsBrace)', 'i')
    imap <C-x>g# <Plug>(MarkCompleteAllAsBrace)
endif
endif

cnoremap <expr> <Plug>(MarkCompleteAll) PatternComplete#NextSearchMatch#InsertInCmdline(mark#AnyMarkPattern())
if ! hasmapto('<Plug>(MarkCompleteAll)', 'c')
    cmap <C-r># <Plug>(MarkCompleteAll)
endif

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
