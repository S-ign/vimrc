filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             
Plugin 'vim-airline/vim-airline'          
Plugin 'vim-airline/vim-airline-themes'   
Plugin 'aradunovic/perun.vim'                  
Plugin 'tpope/vim-fugitive'               
Plugin 'scrooloose/nerdtree'              
Plugin 'tpope/vim-surround'               
Plugin 'kien/ctrlp.vim'                   
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'                
Plugin 'easymotion/vim-easymotion'        
Plugin 'godlygeek/tabular'                
Plugin 'ajh17/vimcompletesme'             
Plugin 'terryma/vim-multiple-cursors'
Plugin 'miyakogi/conoline.vim'
Plugin 'AutoComplPop'
Plugin 'delimitMate.vim'
Plugin 'alvan/vim-closetag'
Plugin 'peterrincker/vim-argumentative'
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'
Plugin 'vim-syntastic/syntastic'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'severin-lemaignan/vim-minimap'
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

syntax on
set term=screen-256color
set t_ut=
set t_Co=256
inoremap jk <esc>
inoremap jo <C-o>
inoremap <F9> <C-O>za
setlocal tabstop=2
setlocal shiftwidth=2
set vb t_vb=
let g:airline_theme= 'angr'
" colorscheme 256-grayvim
let g:conoline_auto_enable = 1
let g:conoline_color_normal_light = "ctermbg=240"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_normal_light = "ctermbg=black"
let g:conoline_color_normal_nr_light = "ctermbg=green"
let g:conoline_color_insert_light = "guibg=#222233"
let g:conoline_color_insert_nr_light = "ctermbg=red"
" Gif config
 map  / <Plug>(easymotion-sn)
 omap / <Plug>(easymotion-tn)
 map  n <Plug>(easymotion-next)
 map  N <Plug>(easymotion-prev)
 map <F4> :! sudo service apache2 restart<CR>
 map <F2> :wa <CR>
 map <C-h> :tabp<CR>
 map <C-l> :tabn<CR>
 nmap <F7> :NERDTreeToggle<CR>
 nmap <A-z> zf<S-]>
 autocmd Filetype * setlocal tabstop=4
