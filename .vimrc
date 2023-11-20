set nocompatible

autocmd Filetype R set comments^=:#'
autocmd Filetype c,cpp,cc set comments^=:///
autocmd Filetype c,cpp,cc set comments^=://'

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'jalvesaq/Nvim-R'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'jalvesaq/R-Vim-runtime'

Plug 'jpalardy/vim-slime'
Plug 'morhetz/gruvbox'

" disable auto-pairs for tex
au Filetype tex let b:AutoPairs = {}

" change cpp comments in commentary
au Filetype c,cpp set commentstring=//\ %s

" automatically close terminal process without exit code
autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', "UltiSnips"]

" Nvim-R options
let R_nvimpager="tab"
let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_assign = 0
let R_openpdf = 0
vmap , <Plug>RDSendSelection
nmap , <Plug>RDSendLine

" fix awful indenting
let r_indent_align_args = 0

"slim
let g:slime_target = "tmux"
let g:slime_python_ipython=1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{bottom-left}' }
let g:slime_dont_ask_default = 1
autocmd Filetype julia nmap , <Plug>SlimeLineSendj
autocmd Filetype julia xmap , <Plug>SlimeRegionSend<C-c>

let g:julia_indent_align_funcargs = 0
let julia_indent_align_funcargs = 0

" vimtex options
let g:Tex_Leader='"'
let g:tex_flavor = "xelatex"
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_general_viewer = 'zathura'

call plug#end()

set termguicolors
set background=dark
colorscheme gruvbox

" colorscheme paper
set laststatus=0

filetype plugin indent on

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

set tw=120
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
syntax on
" set number
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
" set cursorline
set so=5
set backspace=indent,eol,start
let maplocalleader=" "
let mapleader=" "
set path+=**
set title

set mouse=a

set wildignore+=*.pdf,*.o,*.jpg,*.png,*.so

let &rtp = '~/.local/share/nvim/plugged/vimtex,' . &rtp
let &rtp .= ',~/.local/share/nvim/plugged/vimtex/after'

" netrw settings
let g:netrw_keepdir = 0
let g:netrw_winsize = 20
let g:netrw_banner  = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'

nnoremap <leader>dd :Lexplore<CR>

" Fix nvim-r not starting?
let R_tmpdir="~/.tmp"
let R_compldir="~/.tmp"
