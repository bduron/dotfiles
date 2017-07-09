set nocompatible
filetype plugin on
set nu
syntax on
set tabstop=4
set wildmenu
set path+=**
set wildignorecase
set hlsearch
set incsearch
set hidden

" NETRW CONFIG 
let g:netrw_banner=0					"hide banner
let g:netrw_liststyle=3					"tree view
let g:netrw_winsize = 20				"netrw column size 
let g:netrw_list_hide= '.*\.swp$'		"hide netrw & swp files


" RULER FORMAT
set ruler
set rulerformat=%10(%=%*%m[%n]%)
"set rulerformat=%100(%=%*\"%f\"%m\ [%n]%)


" SHORTCUTS
noremap <Leader><Tab> :Lexplore <CR>
noremap <Leader>t :tab sball <CR>
noremap <Leader>l :buffers<CR>:buffer<Space>
noremap <Leader>] <C-^>
noremap <Leader>[ :bnext<CR>
noremap <Leader>n :set nu!<CR>
nmap <Leader><space> :nohlsearch<cr> 			

" SNIPPETS
noremap <Leader>html :read $HOME/.vim/template/boilerplate.html<CR>
noremap <Leader>php :read $HOME/.vim/template/boilerplate.php<CR>kdd7li


" THEME
"colorscheme atom-dark-256
"set t_CO=256	


"-------------Auto-Commands--------------"
"
""Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END


" PATHOGEN
execute pathogen#infect()
filetype plugin indent on


" HOW TO NAVIGATE BIG PROJECTS WITH VIM 
"
" Open all files from root directory with 'vimall' (vim ./**/(.))
" list files with ':ls'
" open files with ':find' or ':b'

