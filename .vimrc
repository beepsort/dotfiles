set nocompatible
set ts=4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set textwidth=120
set autoindent
set smartindent
filetype plugin indent on
set backspace=indent,eol,start
set smartcase
set showmatch
"set formatoptions=lcqj
set lbr
set ofu=syntaxcomplete#Complete
set virtualedit=block,onemore
set splitbelow
set splitright
set mouse=a
autocmd BufEnter,FocusGained * checktime " Refresh current buffer if file changed
let g:vim_json_syntax_conceal = 0 "Disabling concealing json syntax by default
syntax on
set showmode
set showcmd
""set hidden " allow buffers to be hidden with unsaved changes
set cursorline
set number
set relativenumber
set lsp=1
set laststatus=2 " always show status line
" }}}

set noerrorbells visualbell t_vb= " disable annoying bell
" Search options {{{
set incsearch " search while typing
set smartcase
set ignorecase
" }}}

" Key Mapping {{{
" leader
let mapleader = "\<Space>"
" Suspend with ctrl+f
inoremap <C-f> :sus<cr>
vnoremap <C-f> :sus<cr>
nnoremap <C-f> :sus<cr>
" disable help button
map <F1> <Esc>
imap <F1> <Esc>
" create splits
nnoremap <leader>wv :wincmd v<return>
nnoremap <leader>ws :wincmd s<return>
" close split
nnoremap <leader>wq :wincmd q<return>
" Switch between splits
nnoremap <leader>ww :wincmd w<return>
nnoremap <leader>wW :wincmd W<return>
nnoremap <leader>WW :wincmd W<return>
" Toggle netrw
nnoremap <leader>op :Lexplore<return>
" }}}
