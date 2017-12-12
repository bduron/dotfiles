set nocompatible
syntax on
set number


""""""""" Colorschemes 

""let base16colorspace=256
""colorscheme base16-dracula


"""""""""" Scripts

" Shortcut to rapidly toggle `set number`
nmap <leader>n :set number!<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>L :set list!<CR>

" Function to clean trailing whitespaces
function! <SID>StripTrailingWhitespaces()
	" Preparation: save last search, and cursor position.
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Do the business:
	%s/\s\+$//e
	" Clean up: restore previous search history, and cursor position
	let @/=_s
	call cursor(l, c)
endfunction

" F5 : Clean WSpaces
nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>

" Highlight line 81
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

" More natural split openning
set splitbelow
set splitright

" Split panes navigation
nmap  <A-Up> :wincmd k
nmap  <A-Down> :wincmd j<CR>
nmap  <A-Left> :wincmd h<CR>
nmap  <A-Right> :wincmd l<CR>

" Working clipboard under tmux
if $TMUX == ''
	set clipboard+=unnamed
endif


"""""""""""""""""""""""""""""""""""""""
" New bindings
"""""""""""""""""""""""""""""""""""""""

filetype plugin on
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


" JS syntax highlighting

let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
"  Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	else
		return "\<c-p>"
	endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

