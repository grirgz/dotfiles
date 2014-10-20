set foldmethod=indent
set nofoldenable
highlight Folded ctermbg=none ctermfg=grey
set undofile
set undodir=~/.vim/undo
set runtimepath+=~/.vim/ultisnips3/
set so=15

let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsSnippetDirectories = [ "ultisnips3/UltiSnips" ]
let g:UltiSnipsSnippetsDir = "~/.vim/ultisnips3/UltiSnips"
let g:UltiSnipsEditSplit = "vertical"

""delcommand UltiSnipsAddFiletypes "so :UltiSnipsEdit come first

imap <c-j> 
imap <c-k> <Esc><<i
imap <c-l> <Esc>>>i

filetype plugin on
filetype indent on

au BufRead,BufNewFile *.sc 	set filetype=supercollider
au BufRead,BufNewFile *.scd 	set filetype=supercollider
