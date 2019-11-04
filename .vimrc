call plug#begin('~/.vim/plugins')
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'matze/vim-move'
Plug 'unblevable/quick-scope'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-pencil'
Plug 'nvie/vim-togglemouse'
Plug 'yuratomo/w3m.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wincent/command-t', {
 \ 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
 \ }
Plug 'scrooloose/nerdtree'
call plug#end()

set laststatus=2
syntax enable
set background=dark
set timeoutlen=1000 ttimeoutlen=0
colorscheme onedark

function FindChar()
	let c = nr2char( getchar() )
       	let match = search('\V' . c)
endfunction

let mapleader="\<Space>"

map i <Up>
map j <Left>
map k <Down>
noremap h i

" Use ctrl-[hjkl] to select the active split!
"nmap <silent> <c-k> :wincmd j<CR>
"nmap <silent> <c-j> :wincmd h<CR>
"nmap <silent> <c-i> :wincmd k<CR>
"nmap <silent> <c-l> :wincmd l<CR>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateDown<cr>
nnoremap <silent> <c-i> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-p> :TmuxNavigatePrevious<cr>

map <leader>n :NERDTreeToggle<CR>

"nmap <silent> <space>k :wincmd J<CR>
"nmap <silent> <space>j :wincmd H<CR>
"nmap <silent> <space>i :wincmd K<CR>
"nmap <silent> <space>l :wincmd L<CR>

"nmap <silent> <c-W>k :wincmd J<CR>
"nmap <silent> <c-W>j :wincmd H<CR>
"nmap <silent> <c-W>i :wincmd K<CR>
"nmap <silent> <c-W>l :wincmd L<CR>

highlight CursorLine guibg=#303030
highlight Cursor guibg=#626262
set cursorline
set relativenumber
set number
