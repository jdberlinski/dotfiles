" Both of these things are required
set nocompatible
filetype off

"make it so text gets wrapped
:set tw=80

" set up spellcheck
set spell spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" remap ; to : for e f f i c i e n c y
noremap ; :
noremap : ;

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Ultisnips
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" plugins for R --- remaps omnicomplete to CTRL-SPACE, SPACE to send R line/selection
Plugin 'jalvesaq/Nvim-R'
let R_nvimpager="tab"
let Rout_follow_colorscheme = 1
let R_show_arg_help = 0
let R_assign = 0
inoremap <C-z> <C-x><C-o>
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine


"plugins for latex
Plugin 'lervag/vimtex'
let g:Tex_Leader='"'
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_method = "skim"

" commenting
Plugin 'tpope/vim-commentary'

" set up some of the theme stuff
Plugin 'jacoborus/tender.vim'
colorscheme tender
let macvim_skip_colorscheme=1

"enable true colors
set termguicolors

" set directory for ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"enable syntax
syntax on

"enable line numbers
set number
" set up tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" set default latex behavior
let g:tex_flavor = "latex"

" other vim options
set autoread
set wildmenu
set clipboard=unnamed
set nowrap
set ignorecase smartcase
set sidescrolloff=5
set cursorline
set so=5
