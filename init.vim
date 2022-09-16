call plug#begin("~/.vim/plugged")
 " Plugin Section
 Plug 'shaeinst/roshnivim-cs'
 Plug '907th/vim-auto-save'
 Plug 'ryanoasis/vim-devicons'
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
 Plug 'ray-x/lsp_signature.nvim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'easymotion/vim-easymotion'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'folke/trouble.nvim'
 Plug 'akinsho/toggleterm.nvim'
 Plug 'dense-analysis/ale'
 " Plug 'romgrk/barbar.nvim'
 " Plug 'neovim/nvim-lspconfig'
 " Plug 'SmiteshP/nvim-navic'
 " AutoCompletion
 Plug 'davidhalter/jedi-vim'
 Plug 'roxma/nvim-yarp'
 Plug 'ncm2/ncm2'
 Plug 'ncm2/ncm2-bufword'
 Plug 'ncm2/ncm2-path'
 Plug 'ncm2/ncm2-jedi'
 " interactive shell
 Plug 'sillybun/vim-repl'
 " rust
 Plug 'rust-lang/rust.vim'
call plug#end()


" auto save
let g:auto_save = 1  " enable AutoSave on Vim startup
" .vimrc
let g:auto_save_events = ["InsertLeave", "TextChanged"]

let g:python3_host_prog = '/Users/akirawu/miniforge3/bin/python3'

autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
set shortmess+=c
inoremap <c-c> <ESC>

" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'
set encoding=utf8
setglobal fileencoding=utf-8

au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })


let g:ale_linters = {'python': ['flake8']}
let g:toggleterm_terminal_mapping = '<C-y>'


" colorscheme roshnivim-cs

filetype plugin on
filetype plugin indent on   "allow auto-indenting depending on file type

let g:airline_theme = 'papercolor'
let s:fontsize = 10
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
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


tnoremap <esc> <C-\><C-N>
inoremap ;; <esc> 
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <space> za <CR>
map <Leader> <Plug>(easymotion-prefix)

