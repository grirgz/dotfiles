set sessionoptions-=options

set ts=4
set sw=4

let mapleader = "_"

execute pathogen#infect()
let g:startify_session_delete_buffers=1
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
let g:startify_bookmarks = [ 
			\	'~/.vimrc', 
			\	'~/.config/SuperCollider/startup.scd',
			\	'~/code/sc/seco/vlive/WANTTO'
			\]


set foldmethod=indent
set nofoldenable
highlight Folded ctermbg=none ctermfg=grey
highlight Comment ctermbg=none ctermfg=lightblue
set undofile
set undodir=~/.vim/undo
set runtimepath+=~/.vim/ultisnips3/
set scrolloff=15
set diffopt+=vertical

let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsSnippetDirectories = [ "ultisnips3/UltiSnips" ]
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips3/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"

"""" now W and B jump to words ignoring punctuation, wonderful!!!
function! MoveToWord(forward)
	call search('\<', 'W'.a:forward)
endfunction
function! VisualMoveToWord(forward)
	normal gv
	call MoveToWord(a:forward)
endfunction

nnoremap W :call MoveToWord('')<cr>
nnoremap B :call MoveToWord('b')<cr>
vnoremap W :<C-u>call VisualMoveToWord('')<cr>
vnoremap B :<C-u>call VisualMoveToWord('b')<cr>


""" Switch to last-active tab
if !exists('g:Lasttab')
    let g:Lasttab = 1
    let g:Lasttab_backup = 1
endif
autocmd! TabLeave * let g:Lasttab_backup = g:Lasttab | let g:Lasttab = tabpagenr()
autocmd! TabClosed * let g:Lasttab = g:Lasttab_backup
nmap <silent> <Leader>t :exe "tabn " . g:Lasttab<cr>


""" Sideway
nnoremap <c-m-h> :SidewaysLeft<cr>
nnoremap <c-m-l> :SidewaysRight<cr>

""delcommand UltiSnipsAddFiletypes "so :UltiSnipsEdit come first

" Uncomment the following to have Vim jump to the last position when                                                       
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


imap <c-j> 
imap <c-k> <Esc><<i
imap <c-l> <Esc>>>i

filetype plugin on
filetype indent on

au BufRead,BufNewFile *.sc 	set filetype=supercollider
au BufRead,BufNewFile *.scd 	set filetype=supercollider
source ~/.vim/sc.vim " added because dont know what replace .scvimrc in 3.9.1

command! CD cd %:p:h


set updatecount=20000 " write swap file on disk less often to make pasting faster


" vim-indentwise"
"map [- <Plug>(IndentWisePreviousLesserIndent)
"map [= <Plug>(IndentWisePreviousEqualIndent)
"map [+ <Plug>(IndentWisePreviousGreaterIndent)
"map ]- <Plug>(IndentWiseNextLesserIndent)
"map ]= <Plug>(IndentWiseNextEqualIndent)
"map ]+ <Plug>(IndentWiseNextGreaterIndent)
"map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
"map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
"map [% <Plug>(IndentWiseBlockScopeBoundaryBegin)
"map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd)"

"map (h <Plug>(IndentWisePreviousLesserIndent)
"map (j <Plug>(IndentWisePreviousEqualIndent)
"map (l <Plug>(IndentWisePreviousGreaterIndent)
"map )h <Plug>(IndentWiseNextLesserIndent)
"map )j <Plug>(IndentWiseNextEqualIndent)
"map )l <Plug>(IndentWiseNextGreaterIndent)
"map (k <Plug>(IndentWiseBlockScopeBoundaryBegin)
"map )k <Plug>(IndentWiseBlockScopeBoundaryEnd)"

map -hk <Plug>(IndentWisePreviousLesserIndent)
map -k <Plug>(IndentWisePreviousEqualIndent)
map -lk <Plug>(IndentWisePreviousGreaterIndent)
map -hj <Plug>(IndentWiseNextLesserIndent)
map -j <Plug>(IndentWiseNextEqualIndent)
map -lj <Plug>(IndentWiseNextGreaterIndent)
map -hh <Plug>(IndentWiseBlockScopeBoundaryBegin)
map -ll <Plug>(IndentWiseBlockScopeBoundaryEnd)
map ( <Plug>(IndentWisePreviousEqualIndent)
map ) <Plug>(IndentWiseNextEqualIndent)


"" textobj-argument

let g:vim_textobj_parameter_mapping = 'a'
