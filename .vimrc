set nocompatible

autocmd Filetype R set comments^=:#'
autocmd Filetype c,cpp,cc set comments^=:///
autocmd Filetype c,cpp,cc set comments^=://'

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

" ^] to go to definition, ^t to go back
command! MakeTags !ctags -R .

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'jalvesaq/Nvim-R'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-pandoc/vim-pandoc-syntax'

Plug 'jpalardy/vim-slime'

" Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'
" Plug 'vim-airline/vim-airline'

" disable auto-pairs for tex
au Filetype tex let b:AutoPairs = {}

" change cpp comments in commentary
au Filetype cpp setlocal commentstring=//\ %s

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" Nvim-R options
let R_nvimpager="tab"
" let Rout_follow_colorscheme = 1
" let R_show_arg_help = 0
let R_assign = 0
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []
let R_bracketed_paste = 1
let R_openpdf = 0
vmap , <Plug>RDSendSelection
nmap , <Plug>RDSendLine

"slim
let g:slime_target = "tmux"
let g:slime_python_ipython=1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-left}' }
let g:slime_dont_ask_default = 1

" vimtex options
let g:Tex_Leader='"'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_general_viewer = 'zathura'

call plug#end()

" set background=dark
" set termguicolors
" let ayucolor="dark"
colorscheme codedark
" let g:airline_theme = 'codedark'
" set laststatus=3
set laststatus=0
" set noshowmode

filetype plugin indent on

set tw=80
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
autocmd BufWritePre * %s/\s\+$//e
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoread
set wildmenu
set clipboard=unnamed
set nowrap
set ignorecase smartcase
set sidescrolloff=5
set cursorline
set so=5
set backspace=indent,eol,start
let maplocalleader=" "
let mapleader=" "
set path+=**

set mouse=a

set wildignore+=*.pdf,*.o,*.jpg,*.png,*.so

let &rtp = '~/.local/share/nvim/plugged/vimtex,' . &rtp
let &rtp .= ',~/.local/share/nvim/plugged/vimtex/after'
