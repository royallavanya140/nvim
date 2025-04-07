" init.vim
set nocompatible
filetype off

" Basic settings
set is hls nu cursorline hidden splitright splitbelow
set mouse=a
set clipboard=unnamedplus
set encoding=utf-8
set termguicolors
set updatetime=300
set signcolumn=yes
let g:airline_powerline_fonts = 1

" Initialize vim-plug
call plug#begin('~/.local/share/nvim/plugged')

" Core plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP plugins
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Python specific
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

" Database
Plug 'tpope/vim-dadbod'

" UI enhancements
Plug 'TaDaa/vimade'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-lualine/lualine.nvim'

call plug#end()
filetype plugin indent on

" Color scheme
colorscheme tokyonight-night

" ALE settings
let g:ale_linters = {'python': ['flake8', 'pydocstyle', 'bandit']}
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\    'python': ['black'],
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" LSP Keybindings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_next()<CR>

nnoremap <C-g> :B<CR>
" Cursorline settings
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Source Lua configs
lua require('completion')

" Set completeopt for better completion experience
set completeopt=menu,menuone,noselect
let g:is_transparent = 0

function! ToggleBackground()
  if g:is_transparent
    highlight Normal guibg=#1e1e2e ctermbg=NONE
    highlight NonText guibg=#1e1e2e ctermbg=NONE
    let g:is_transparent = 0
    echo "Background: Solid"
  else
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    let g:is_transparent = 1
    echo "Background: Transparent"
  endif
endfunction

command! Bg call ToggleBackground()
" set guifont=FiraCode\ Nerd\ Font:h12
" set guifont=JetBrainsMono:h12
set guifont=JetBrainsMono\ Nerd\ Font:h12
let g:airline_powerline_fonts = 1
