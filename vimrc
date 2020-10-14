" [Start] Setting from https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
set backspace=2               " compatible with version 5.4 and earlier
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" personal setting for plugins 
Plugin 'kien/ctrlp.vim' " ctrlp, easy file finder
Plugin 'scrooloose/nerdcommenter' " nerdcommenter, easy comment/decomment
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }  " nerdtree, explore filesystem for vim
Plugin 'jistr/vim-nerdtree-tabs' " nerdtree-tabs, NERDTree and tabs together in Vim, painlessly
Plugin 'klen/python-mode' " python-mode
Plugin 'davidhalter/jedi-vim' " jedi-vim
Plugin 'airblade/vim-gitgutter' " vim-gitgutter, shows a git diff
Plugin 'Xuyuanp/nerdtree-git-plugin' " nerdtree-git, git plugin for nerdtree
" Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
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
" [End] Setting from https://github.com/VundleVim/Vundle.vim

colorscheme peachpuff

" --- NERDTree Tabs Setting ----------------------------------------------------------------"
" NERDTree auto open
let g:nerdtree_tabs_open_on_gui_startup=1     " Open NERDTREE on gvim/macvim startup
let g:nerdtree_tabs_open_on_console_startup=1 " Open NERDTree on console vim startup
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'
" ------------------------------------------------------------------------------------------"

" --- NERDCommenter Setting ----------------------------------------------------------------"
let g:NERDSpaceDelims = 1
" ------------------------------------------------------------------------------------------"

" --- NERDTree Git Setting ----------------------------------------------------------------"
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "~",
      \ "Staged"    : "+",
      \ "Untracked" : "u",
      \ "Renamed"   : "r",
      \ "Unmerged"  : "!",
      \ "Deleted"   : "-",
      \ "Dirty"     : "*",
      \ "Clean"     : "",
      \ "Unknown"   : "?"
      \ }
" ------------------------------------------------------------------------------------------"

" -----python-mode Setting----------------------------------------------------------------- "
set foldlevel=99
let g:pymode_options_colorcolumn = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_ignore = ["E501", "E402", "C901"]

let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#use_splits_not_buffers = 'top'
let g:jedi#completions_command = "<Tab><Space>"
" ------------------------------------------------------------------------------------------"

" --- Key Mapping Setting-------------------------------------------------------------------"
map <F1> :NERDTreeTabsToggle<CR>
map <F2> :set paste!<CR>
map <F3> :set nonumber!<CR>
map <F4> :set hlsearch!<CR>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

let mapleader="'"
nnoremap <CR> o<Esc>
nnoremap <Leader><CR> O<ESC>
" ------------------------------------------------------------------------------------------"

set autoindent
set cindent " auto inden for C
set smartindent " set smart indent
set nobackup " do not create backup files
set ruler " show current cursor position
set number " show line number

set tabstop=4 " set tab as 2 spaces
set expandtab " use space instead of tab
set shiftwidth=4 " auto indent = 2 spaces

syntax enable " use syntax highlighter
set title " show title
set showmatch " show matched brackets
set hlsearch " highlighted searched results
set smartcase " sensitive case search
set clipboard=unnamed " setting for MAC. for iterm2, enable Use modern parser (experimental) in preference > profile > terminal

set mouse=a " enable vim automatic visual mode using mouse " press shift for disable (e.g. for copy & paste)

set wildmenu
set wildignore=*.bak,*.o,*.e,*~
set completeopt-=preview

" use :tn as shortcut of :tabnew
ca tn tabnew
command! W w " use :W as save
command! Q q " use :Q as quit

hi Search ctermfg=Black
hi Visual ctermbg=Black ctermfg=None cterm=reverse
hi Pmenu ctermbg=Black ctermfg=None
