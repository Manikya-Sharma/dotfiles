set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase smartcase    " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set invhlsearch             " remove search highlight
set nowrap                  " disable soft wrapping
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
" set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " relatice line numbering
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()
" Plug 'https://github.com/vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'https://github.com/preservim/nerdtree'
" Plug 'https://github.com/rafi/awesome-vim-colorschemes'
" Plug 'https://github.com/tc50cal/vim-terminal'
" Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'lukas-reineke/lsp-format.nvim'

" Plug 'liuchengxu/space-vim-dark'
" Plug 'https://github.com/folke/tokyonight.nvim'
" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
" Plug 'oxfist/night-owl.nvim'
" Plug 'https://github.com/rose-pine/neovim'
Plug 'https://github.com/rebelot/kanagawa.nvim'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.5.0'}
" Plug 'windwp/nvim-autopairs'
Plug 'https://github.com/kylechui/nvim-surround'
Plug 'mbbill/undotree'
Plug 'junegunn/vim-peekaboo'
Plug 'https://github.com/lewis6991/gitsigns.nvim'
Plug 'https://github.com/folke/flash.nvim'
call plug#end()

noremap <C-b> :NERDTreeFocus<CR>
noremap <C-b> :NERDTreeToggle<CR>

noremap <C-M> :bnext<CR>
noremap <C-P> :bprev<CR>

" Map `jk` to <Esc>
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction
inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
noremap <C-j> <Esc>

" clang-format
noremap <C-K> mf<CR>:%!clang-format<CR>'fzz

" use K for documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>

" toggle inlay hints
noremap <C-I> :CocCommand document.toggleInlayHint<CR>

" soft wrapping movement by default
noremap j gj
noremap k gk

" no soft-wrap left-right movement
noremap <C-L> 10zl
noremap <C-H> 10zh

" remap undo tree
noremap <C-Q> :UndotreeToggle<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Ctrl+f for :Files
noremap <silent> <C-f> :Files<CR>

" use rg instead of grep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" colorscheme jellybeans
" colorscheme space-vim-dark
" colorscheme tokyonight
" colorscheme catppuccin-macchiato
" colorscheme night-owl
" colorscheme rose-pine-moon
colorscheme kanagawa

hi Comment cterm=italic
" hi Normal     ctermbg=NONE guibg=NONE
" hi LineNr     ctermbg=NONE guibg=NONE
" hi SignColumn ctermbg=NONE guibg=NONE
" hi Comment guifg=#5C6370 ctermfg=59

set formatprg=clang-format

lua << END
require('lualine').setup{
    options = {theme = "palenight"},
}
-- require('lsp-format').setup {}
require('treesitter')
require('nvim-treesitter.configs').setup {
    indent = {
        enable = true 
     },
}
require('nvim-surround').setup()
require('gitsigns').setup()
require("flash").setup{
    modes = {
        char = {
            highlight = {
                backdrop = false
            }
        }
    }
}
END
