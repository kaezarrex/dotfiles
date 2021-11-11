" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'andrejlevkovitch/vim-lua-format' 
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 

" https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

"Golang:
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

" Start lsp
lua require('language_server')

" Format Go on save
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

" Format Lua on save
autocmd FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<cr>
autocmd BufWrite *.lua call LuaFormat()

set termguicolors
colorscheme gruvbox-material
let g:gruvbox_material_palette = 'original'

let g:airline_powerline_fonts = 1

" File Browsing
set path=.,,
set wildmode=longest,list,full
set wildmenu

set number
set spell

set swapfile
set dir=/tmp

" enable persistent undos
if has('persistent_undo')
    set undodir=/tmp
    set undofile
endif

" turn off arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Folding
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap f za
set foldlevelstart=5    " start with fold level of 5

" Folding - use f to fold/unfold blocks
let g:python_fold_comments = 0
let g:python_fold_docstrings = 0
