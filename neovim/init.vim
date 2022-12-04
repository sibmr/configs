" Basic Config {{{ 

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set scrolloff=10
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set splitright              " open new split panes to right
set splitbelow              " open new split panes below
set foldmethod=marker
set nowrap
let mapleader=","
set timeout timeoutlen=1500
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

" }}}

" Plugins {{{ 
call plug#begin("~/.vim/plugged")
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'lervag/vimtex'
 Plug 'peterbjorgensen/sved'
call plug#end()

"}}}

" Color Schemes ------------------------------------------------------------{{{
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
" colorscheme evening
colorscheme dracula
" --------------------------------------------------------------------------}}}

" Mappings -----------------------------------------------------------------{{{

" misc inoremaps
inoremap jj <esc>
inoremap öö {
inoremap ää }

" misc nnoremaps
nnoremap <A-f> :NERDTree<CR>

"misc vnoremaps
"vnoremap jk <esc>  " delays the visual mode selection too much

" move line or or visually selected block - alt+j/k
inoremap <A-j> <esc>:m .+1<CR>==gi
inoremap <A-k> <esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-i> <C-W>J
nnoremap <A-j> <C-W>K
nnoremap <A-k> <C-W>L

" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --------------------------------------------------------------------------}}}

" Plugin Config ------------------------------------------------------------{{{

" VimTeX ---------------------------------------------------------------------

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
" let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","

" SVED sync evince and nvim over dbus
nmap <F4> :call SVED_Sync()<CR>

" --------------------------------------------------------------------------}}}

" Filetype -----------------------------------------------------------------{{{

" .tex files
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us

" --------------------------------------------------------------------------}}}

" Needed in WSL Only -------------------------------------------------------{{{
" prevent crash caused by yy and p related to win32yank
set clipboard=unnamedplus
" --------------------------------------------------------------------------}}}
