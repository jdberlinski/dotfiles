set nocompatible
filetype off

set tw=80
set spell spelllang=en_us

autocmd BufWritePre * %s/\s\+$//e
noremap ; :
noremap : ;
inoremap <C-l> <C-g>u<esc>[s1z=`]a<C-g>u

let maplocalleader=" "
let mapleader=" "

nnoremap <leader>v <C-^>
nnoremap <leader>f :find

" documentation comments
au FileType R set comments^=:#'
au FileType c,cpp,cc set comments^=:///
au FileType R set comments^=://'


syntax enable
set nu
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
set showcmd

"^] to go to definition, ^t to go back
command! MakeTags !ctags -R .

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=75
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'dracula/vim',{'name':'dracula'}
Plugin 'SirVer/ultisnips'
Plugin 'jalvesaq/Nvim-R'
Plugin 'vimwiki/vimwiki'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" disable autopairs for tex
au FileType tex let b:AutoPairs = {}

"change cpp comments in commentary
au FileType cpp setlocal commentstring=//\ %s

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
let g:tex_flavor="latex"
let g:vimtex_quickfix_latexlog={'default': 0}
let g:vimtex_quickfix_mode = 2
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_general_viewer='okular'
let g:vimtex_view_general_options='--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk='--unique'

cal vundle#end()
filetype plugin indent on
set termguicolors
colorscheme dracula

set wildignore+=*.pdf,*.o,*.jpg,*.png,*.so
syn match myExCapitalWords +\<\w*[A-Z]\K*\>\|'s+ contains=@NoSpell
