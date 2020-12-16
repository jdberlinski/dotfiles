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
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'
Plug 'chrisbra/csv.vim'

Plug 'owickstrom/vim-colors-paramount'
Plug 'gruvbox-community/gruvbox'

"
nnoremap <C-m> :NERDTreeToggle<CR>

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
" let g:vimtex_quickfix_latexlog = {'default' : 0}
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

call plug#end()

" colorscheme acme
set background=dark
" colorscheme paramount
autocmd vimenter * colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='soft'
let g:gruvbox_italic=1

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

set wildignore+=*.pdf,*.o,*.jpg,*.png,*.so
highlight Comment cterm=italic gui=italic

let &rtp = '~/.local/share/nvim/plugged/vimtex,' . &rtp
let &rtp .= ',~/.local/share/nvim/plugged/vimtex/after'
