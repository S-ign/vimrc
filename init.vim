" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'VundleVim/Vundle.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'aradunovic/perun.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'godlygeek/tabular'
NeoBundle 'ajh17/vimcompletesme'
"NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'miyakogi/conoline.vim'
NeoBundle 'delimitMate.vim'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'peterrincker/vim-argumentative'
NeoBundle 'aserebryakov/vim-todo-lists'
NeoBundle 'dense-analysis/ale'
NeoBundle 'yggdroot/indentline'
NeoBundle 'fatih/vim-go'
NeoBundle 'nsf/gocode', {'rtp': 'nvim/'}
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-go'
NeoBundle 'deoplete-plugins/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'nvim-lua/popup.nvim'
NeoBundle 'nvim-lua/plenary.nvim'
NeoBundle 'nvim-telescope/telescope.nvim'
NeoBundle 'yuttie/comfortable-motion.vim'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" if has('nvim')
    " Enable deoplete on startup
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
call deoplete#custom#option('auto_complete_delay', 0)

if executable('rg')
	let g:rg_derive_root='true'
endif
"endif

" Disable deoplete when in multi cursor mode
" function! Multiple_cursors_before()
"     let b:deoplete_disable_auto_complete = 1
" endfunction
" function! Multiple_cursors_after()
"     let b:deoplete_disable_auto_complete = 0
" endfunction

" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" close preview window on leaving the insert mode
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" leader key is ,
let mapleader=","

filetype plugin indent on    " required
syntax on
set t_ut=
set t_Co=256
set vb t_vb=
inoremap jk <esc>
inoremap jl <C-o>
inoremap <F9> <C-O>za
set tabstop=2
set shiftwidth=2
setlocal tabstop=2
setlocal shiftwidth=2

"nvim colorscheme
colorscheme Atelier_DuneDark

"airline settings
let g:airline_theme                  = 'badwolf'

"conoline settings
let g:conoline_auto_enable           = 1
let g:conoline_color_normal_light    = "ctermbg = 240"
let g:conoline_color_normal_nr_light = "ctermbg = 240 ctermfg = white"
let g:conoline_color_normal_light    = "ctermbg = black"
let g:conoline_color_normal_nr_light = "ctermbg = green"
let g:conoline_color_insert_light    = "guibg   = #222233"
let g:conoline_color_insert_nr_light = "ctermbg = red"

"syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_quiet_messages = {"regex": ['one space', 'too long']}
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_full_redraws=0

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <F2> :wa<CR>:GoLint<CR>
map <A-j> :lprev<CR>
map <A-k> :lnext<CR>
map <A-h> :tabp<CR>
map <A-l> :tabn<CR>
map <A-\> /pogchamp<CR>
map <A-c> :lclose<CR>
map <A-o> :lopen<CR>
map <C-l> :set number! relativenumber!<CR>
nmap <F8> :NERDTreeToggle<CR>
nmap <A-p> :set paste!<CR>
nmap <A-z> :GoRen<CR>

" old go coverage map
" nmap <A-t> :! go test -cover

" new go coverage map that spits out a html file you can visually see the
" coverage with color
nmap <A-t> :! go test -coverprofile=coverage.out && go tool cover -html=coverage.out<CR>

nmap <A-r> :GoRun<CR>
nmap <A-[> :GoDeclsDir<CR>
nmap <A-i> :GoImports<CR>
nmap <C-a> :GoAlternate<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
