" vim options
set nocompatible
filetype off
set tw=80
set spell spelllang=en_us

autocmd BufWritePre * %s/\s\+$//e
noremap ; :
noremap : ;
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

let maplocalleader=" "
let mapleader=" "

autocmd Filetype R set comments^=:#'
autocmd Filetype c,cpp,cc set comments^=:///
autocmd Filetype c,cpp,cc set comments^=://'

set background=dark
syntax on
set number
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoread
set path+=**
set wildmenu
set clipboard=unnamed
set nowrap
set ignorecase smartcase
set cursorline
set so=5

" ^] to go to definition, ^t to go back
command! MakeTags !ctags -R .

" vundle options
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'sstallion/vim-wtf'

"Plugins
Plugin 'SirVer/ultisnips'
Plugin 'jalvesaq/Nvim-R'
Plugin 'vimwiki/vimwiki'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'preservim/nerdtree'

"
nnoremap <C-n> :NERDTreeToggle<CR>

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
let Rout_follow_colorscheme = 1
let R_show_arg_help = 0
let R_assign = 0
inoremap <nul> <C-x><C-o>
vmap , <Plug>RDSendSelection
nmap , <Plug>RDSendLine

" vimtex options
let g:Tex_Leader='"'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

call vundle#end()
set termguicolors
colorscheme wtf
filetype plugin indent on

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
