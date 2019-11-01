call plug#begin('~/.vim/plugins')
Plug 'yuttie/comfortable-motion.vim'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'matze/vim-move'
Plug 'unblevable/quick-scope'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-pencil'
Plug 'nvie/vim-togglemouse'
Plug 'yuratomo/w3m.vim'
call plug#end()
set laststatus=2
syntax enable
set background=dark
colorscheme onedark

function FindChar()
	let c = nr2char( getchar() )
       	let match = search('\V' . c)
endfunction
