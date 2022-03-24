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
NeoBundle 'mattn/emmet-vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'godlygeek/tabular'
NeoBundle 'ajh17/vimcompletesme'
NeoBundle 'mg979/vim-visual-multi'
NeoBundle 'miyakogi/conoline.vim'
NeoBundle 'delimitMate.vim'
NeoBundle 'alvan/vim-closetag'
NeoBundle 'peterrincker/vim-argumentative'
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'dense-analysis/ale'
NeoBundle 'fatih/vim-go'
NeoBundle 'chreekat/vim-paren-crosshairs'
NeoBundle 'nvim-lua/popup.nvim'
NeoBundle 'nvim-lua/plenary.nvim'
NeoBundle 'nvim-telescope/telescope.nvim'
NeoBundle 'yuttie/comfortable-motion.vim'
NeoBundle 'neovim/nvim-lspconfig'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tomlion/vim-solidity'
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"let g:deoplete#enable_at_startup = 0
"autocmd InsertEnter * call deoplete#enable()
"
"if executable('rg')
"	let g:rg_derive_root='true'
"endif

lua << EOF 
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "gopls", "tsserver", "solc"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF 

" leader key is ,
let mapleader=" "

filetype plugin indent on    " required
syntax on
set t_ut=
set t_Co=256
set vb t_vb=
set colorcolumn=80
inoremap jk <esc>
inoremap jl <C-o>
inoremap <F9> <C-O>za
set tabstop=2
set shiftwidth=2
set expandtab
setlocal tabstop=2
setlocal shiftwidth=2

"favorite nvim colorschemes:
"Blacksea
colorscheme nord

"airline settings
let g:airline_theme                  = 'luna'
let g:airline_powerline_fonts = 1

"conoline settings
let g:conoline_auto_enable           = 1
let g:conoline_color_normal_light    = "ctermbg = 240"
let g:conoline_color_normal_nr_light = "ctermbg = 240 ctermfg = white"
let g:conoline_color_normal_light    = "ctermbg = black"
let g:conoline_color_normal_nr_light = "ctermbg = green"
let g:conoline_color_insert_light    = "guibg   = #222233"
let g:conoline_color_insert_nr_light = "ctermbg = red"

let g:indent_guides_enable_on_vim_startup = 1
let g:go_gopls_enabled = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
map <F2> :wa<CR>:GoDiagnostics<CR>
map <F3> :wa<CR>:! tsc %<CR>
map <F4> :wa<CR>:terminal go test -v ./... \| tc<CR>
map <A-j> :lprev<CR>
map <A-k> :lnext<CR>
map <A-h> :tabp<CR>
map <A-l> :tabn<CR>
map <A-\> :noh<CR>
map <A-c> :lclose<CR>
map <A-o> :lopen<CR>
map <C-l> :set number! relativenumber!<CR>
map <C-s> :setlocal spell! spelllange=en_us!<CR>
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
nnoremap <leader>ff <cmd>Telescope find_files theme=ivy<cr>
nnoremap <leader>fg <cmd>Telescope live_grep theme=ivy<cr>
nnoremap <leader>fb <cmd>Telescope buffers theme=ivy<cr>
nnoremap <leader>fh <cmd>Telescope help_tags theme=ivy<cr>
nnoremap <leader>fc <cmd>Telescope commands theme=ivy<cr>
"nnoremap <leader>err !!cat ~/nvim/templates/go/err.txt<cr>Vj>o
nnoremap <leader>err :GoIfErr<cr>
nnoremap <leader>bap !!cat ~/nvim/templates/go/buffalo/assetPath<cr>f"a
nnoremap <leader>rfce !!cat ~/nvim/templates/react/rfce<cr>:%s/Header/\=expand('%:t:r')<cr>:noh<cr>

let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(75)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-75)<CR>
