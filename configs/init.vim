call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
set encoding=UTF-8
set number
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:OmniSharp_server_stdio=1
let g:clang_library_path='/usr/lib/llvm-8/lib'
