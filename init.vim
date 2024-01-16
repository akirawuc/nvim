call plug#begin("~/.vim/plugged")

 Plug 'tpope/vim-sensible'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-abolish'
 Plug 'github/copilot.vim'

 " appearance
 Plug 'ryanoasis/vim-devicons'
 Plug 'kyazdani42/nvim-web-devicons' Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'morhetz/gruvbox'
 Plug 'hachy/eva01.vim', { 'branch': 'main' }

 " useful tools
 Plug '907th/vim-auto-save'
 Plug 'scrooloose/nerdtree'
 Plug 'easymotion/vim-easymotion'
 Plug 'voldikss/vim-floaterm'

 Plug 'mhinz/vim-startify'
 Plug 'ray-x/lsp_signature.nvim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'folke/trouble.nvim'
 Plug 'akinsho/toggleterm.nvim'
 " Plug 'davidhalter/jedi-vim'
 " Plug 'roxma/nvim-yarp'
 " rust
 Plug 'rust-lang/rust.vim'
 " js related
 "
 Plug 'neoclide/jsonc.vim'
 Plug 'othree/html5.vim'
 Plug 'pangloss/vim-javascript'
 Plug 'MaxMEllon/vim-jsx-pretty'
 Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
 Plug 'leafgarland/typescript-vim'
 Plug 'peitalin/vim-jsx-typescript'
 Plug 'TovarishFin/vim-solidity'
call plug#end()


set encoding=utf8
setglobal fileencoding=utf-8

"
" auto save
let g:auto_save = 1  " enable AutoSave on Vim startup
" .vimrc
let g:auto_save_events = ["InsertLeave", "TextChanged"]
" auto save end
" 

let g:python3_host_prog = '/Users/akirawu/miniforge3/bin/python3'


" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
set background=dark
colorscheme gruvbox

filetype plugin on
filetype plugin indent on   "allow auto-indenting depending on file type

let g:airline_theme = 'base16'
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
set relativenumber          " setting the displayed line number to relative
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
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" buffer
set hidden
nnoremap <silent> bl :ls<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bd :bdelete<CR>
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" coc
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use shift-tab to go to the previous selection
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use enter to select the highlighting selection
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              " \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" floaterm settings: mapping
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
