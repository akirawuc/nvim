-- Initialize the plugin manager
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Ensure packer itself is managed

  -- Core plugins
  use 'tpope/vim-sensible'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-abolish'
  use 'github/copilot.vim'
  use 'nvim-lua/plenary.nvim'

  -- Appearance
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'morhetz/gruvbox'
  use { 'hachy/eva01.vim', branch = 'main' }

  -- Useful tools
  use '907th/vim-auto-save'
  use 'preservim/nerdtree' -- Updated NERDTree repo
  use 'easymotion/vim-easymotion'
  use 'voldikss/vim-floaterm'
  use 'mhinz/vim-startify'
  use 'ray-x/lsp_signature.nvim'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use 'folke/trouble.nvim'
  use 'akinsho/toggleterm.nvim'

  -- Rust support
  use 'rust-lang/rust.vim'

  -- JS and frontend support
  use 'neoclide/jsonc.vim'
  use 'othree/html5.vim'
  use 'pangloss/vim-javascript'
  use 'MaxMEllon/vim-jsx-pretty'
  use { 'styled-components/vim-styled-components', branch = 'main' }
  use 'leafgarland/typescript-vim'
  use 'peitalin/vim-jsx-typescript'
  use 'TovarishFin/vim-solidity'
  use {
  "pmizio/typescript-tools.nvim",
  requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    require("typescript-tools").setup {}
  end,
 }
end)

-- General settings
vim.o.encoding = 'utf-8'
vim.g.fileencoding = 'utf-8'
vim.o.background = 'dark'
vim.o.nocompatible = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.mouse = 'a'
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cc = "80"
vim.o.syntax = 'on'
vim.o.clipboard = 'unnamedplus'
vim.o.cursorline = true
vim.o.ttyfast = true

-- Python interpreter
vim.g.python3_host_prog = '/Users/akirawu/miniforge3/bin/python3'

-- Airline config
vim.g.lightline = { colorscheme = 'gruvbox' }
vim.g.airline_theme = 'base16'
vim.cmd('colorscheme gruvbox')

-- Auto-save settings
vim.g.auto_save = 1
vim.g.auto_save_events = {"InsertLeave", "TextChanged"}

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    -- NERDTree mappings
    vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTree<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
  end
})

-- Window navigation mappings
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
  end
})

-- EasyMotion mappings
vim.api.nvim_set_keymap('', '<Leader>', '<Plug>(easymotion-prefix)', {})
vim.api.nvim_set_keymap('', '<Leader>w', '<Plug>(easymotion-bd-w)', {})

-- Buffer management mappings
vim.o.hidden = true
vim.api.nvim_set_keymap('n', 'bl', ':ls<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bn', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'bd', ':bdelete<CR>', { noremap = true, silent = true })

-- Coc.nvim settings
vim.api.nvim_set_keymap('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"', { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-Space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Floaterm mappings
vim.api.nvim_set_keymap('n', '<F7>', ':FloatermNew<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F7>', '<C-\\><C-n>:FloatermNew<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F8>', ':FloatermPrev<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':FloatermNext<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F9>', '<C-\\><C-n>:FloatermNext<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<F12>', ':FloatermToggle<CR>', { silent = true })
vim.api.nvim_set_keymap('t', '<F12>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })

