" Vim 8 vimrc boilerplate
" =======================

" Load default vimrc
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Options
set clipboard=unnamed " Sync with system clioboard
set hidden " Unsaved files can be 'hidden'
"set hlsearch " Higlight search (hurts your eyes with default colors)
set ignorecase " For search and wildmenu
set list listchars=tab:\-\  " Show tabs if used
set number relativenumber " To see [count]j/k
set omnifunc=syntaxcomplete#Complete " c-x c-o to complete syntax
set rulerformat=%y%m " [filetype][modified]
set wildmode=lastused:full " lastused :buffer

" Vim Fuzzy Find Files
" (http://www.akhatib.com/fuzzy-find-files-in-vim-without-a-plugin)
set path=$PWD/**        " Enable fuzzy finding in the vim command line
set wildignore+=**/.git/**,**/__pycache__/**,**/venv/**,**/node_modules/**,**/dist/**,**/build/**,*.o,*.pyc,*.swp


" Keymaps vanilla
" ---------------

" Set space as leader key
nnoremap <space> <nop>
let mapleader=' '

" Fix Y to yank as C or D works
nnoremap Y yg_

" For some non US keyboards
nnoremap <leader>9 <c-]>

nnoremap s /
nnoremap S ?
cnoremap <c-p> <up>
nnoremap <leader><tab> :buffer 
nnoremap <leader>w :w<cr>


" Packages config
" ---------------
"
" Requires package manager: https://github.com/kristijanhusak/vim-packager

" Netrw
let g:netrw_preview=1 " Vertical preview
let g:netrw_localcopydircmd='cp -r'
let g:netrw_winsize=25

" FZF Fuzzy finder
nnoremap <leader>ff :Files<cr>
xnoremap <leader>ff :Files<cr>

" Autocompletion MUcomplete
set completeopt+=menuone,noselect
set shortmess+=c " Shut off completion messages
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Commands for packages
command! -nargs=* -bar PackagerInstall call PackagerInit() | call packager#install(<args>)
command! -nargs=* -bar PackagerUpdate call PackagerInit() | call packager#update(<args>)
command! -bar PackagerClean call PackagerInit() | call packager#clean()
command! -bar PackagerStatus call PackagerInit() | call packager#status()

" Packages
function! PackagerInit() abort
	packadd vim-packager
	call packager#init()
	call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call packager#add('tpope/vim-surround')
	call packager#add('sheerun/vim-polyglot')
	call packager#add('editorconfig/editorconfig-vim')

	" Fuzzy finder
	call packager#add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
	call packager#add('junegunn/fzf.vim')

	" Autocompletion
	call packager#add('lifepillar/vim-mucomplete')
endfunction
