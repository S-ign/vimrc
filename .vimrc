filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins"
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
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
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'scrooloose/syntastic'

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
set vb t_vb=
inoremap jk <esc>
inoremap jl <C-o>
inoremap <F9> <C-O>za                                                                                                                                                               Xinoremap <F9> <C-O>za
setlocal tabstop=2
setlocal shiftwidth=2

"nvim colorscheme
colorscheme Atelier_DuneDark

"airline settings
let g:airline_theme                  = 'angr'

"conoline settings
let g:conoline_auto_enable           = 1
let g:conoline_color_normal_light    = "ctermbg = 240"
let g:conoline_color_normal_nr_light = "ctermbg = 240 ctermfg = white"
let g:conoline_color_normal_light    = "ctermbg = black"
let g:conoline_color_normal_nr_light = "ctermbg = green"
let g:conoline_color_insert_light    = "guibg   = #222233"
let g:conoline_color_insert_nr_light = "ctermbg = red"

"syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_quiet_messages = {"regex": ['one space', 'too long']}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_full_redraws=0

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <F2> :wa <CR>
map <F3> :! sudo service apache2 restart<CR>
map <A-j> :lprev<CR>
map <A-k> :lnext<CR>
map <A-h> :tabp<CR>
map <A-l> :tabn<CR>
map <A-\> /skdjfljskdjfkdjfh<CR>
map <A-c> :lclose<CR>
map <A-o> :lopen<CR>
nmap <F7> :NERDTreeToggle<CR>
nmap <A-z> zf<S-]>
autocmd Filetype * setlocal tabstop=4
