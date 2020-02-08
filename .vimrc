set nocompatible              " be iMproved, required
filetype off                  " required

"make it so things get wrapped
:set tw=100

" set up spellcheck
set spell spelllang=en_us

" auto remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"other plugins
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"plugins for C
map <F8> :w<CR> :!gcc % -o %< -std=c11 -Wall -pedantic && ./%<<CR>

" plugins for R
Plugin 'jalvesaq/Nvim-R'
let R_nvimpager="tab"
let Rout_follow_colorscheme = 1
inoremap <Nul> <C-x><C-o>
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine



"plugins for latex
Plugin 'lervag/vimtex'
let g:Tex_Leader='"'
let g:vimtex_quickfix_autoclose_after_keystrokes = 1
let g:vimtex_view_method = "skim"

" plugins for javascript
Plugin 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
Plugin 'leshill/vim-json'

" linting
Plugin 'dense-analysis/ale'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
            \ 'html' : [],
            \ 'javascript' : ['eslint']
            \}
let g:ale_fixers = {
            \ 'javascript' : ['prettier'],
            \ 'latex' : ['latexindent']
            \}

" smooth scrolling
Plugin 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" commenting
Plugin 'tpope/vim-commentary'

" set up some of the theme stuff
Plugin 'itchyny/lightline.vim'
Plugin 'kaicataldo/material.vim'
let g:material_theme_style = 'darker'
let g:material_terminal_italics = 1
colorscheme material
let g:lightline = {'colorscheme' : 'material_vim'}
set laststatus=2
set noshowmode

"enable true colors
if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if (has('termguicolors'))
    set termguicolors
endif


" set directory for ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"enable syntax
syntax on

"enable line numbers
set number relativenumber
" enable auto switching line number style
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" set up tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" set default latex behavior
let g:tex_flavor = "latex"

" other vim options
set autoread
set wildmenu
set clipboard=unnamed
set nowrap
set listchars=extends:→
set listchars+=precedes:←
set ignorecase smartcase
set sidescrolloff=5

"enable plugins
filetype on
filetype plugin indent on

