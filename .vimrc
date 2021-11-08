" # Vimrc Boilerplate Version >= 8

" Load Vim v. 8 default config
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" ## Options

set list listchars=tab:\|\ 
set number relativenumber " Don't count lines to [count]j/k
set omnifunc=syntaxcomplete#Complete " Set omnifunc to complete syntax

" ## Keymaps

" Set space as leader key
nn <space> <nop>
let mapleader=' '

" Fix Y to yank from cursor to end of line, not the default of yank line (use
" yy for that).
nn Y yg_

"Lazy load plugins with a mapping
" nnoremap <silent><Leader>ww :unmap <Leader>ww<BAR>packadd vimwiki<BAR>VimwikiIndex<CR>

" ## Plugins

" Requires package manager: https://github.com/kristijanhusak/vim-packager

function! s:packager_init(packager) abort
	call a:packager.add('kristijanhusak/vim-packager', { 'type': 'opt' })
	call a:packager.add('junegunn/fzf', { 'do': './install --all && ln -s $(pwd) ~/.fzf'})
	call a:packager.add('junegunn/fzf.vim')
	" call a:packager.add('Shougo/deoplete.nvim')
	" call a:packager.add('autozimu/LanguageClient-neovim', { 'do': 'bash install.sh' })
	" call a:packager.add('hrsh7th/vim-vsnip-integ', {'requires': ['hrsh7th/vim-vsnip'] })
	" call a:packager.local('~/my_vim_plugins/my_awesome_plugin')

	"Provide full URL; useful if you want to clone from somewhere else than Github.
	" call a:packager.add('https://my.other.public.git/tpope/vim-fugitive.git')

	"Loaded only for specific filetypes on demand. Requires autocommands below.
	" call a:packager.add('kristijanhusak/vim-js-file-import', { 'do': 'npm install', 'type': 'opt' })
	" call a:packager.add('fatih/vim-go', { 'do': ':GoInstallBinaries', 'type': 'opt' })
endfunction

silent! packadd vim-packager

if exists('packager')
	call packager#setup(function('s:packager_init'))

	"Load plugins only for specific filetype
	"Note that this should not be done for plugins that handle their loading using ftplugin file.
	"More info in :help pack-add
	augroup packager_filetype
		autocmd!
		" autocmd FileType javascript packadd vim-js-file-import
		" autocmd FileType go packadd vim-go
	augroup END
endif
