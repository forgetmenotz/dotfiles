call plug#begin('~/.vim/plugins')
"Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'matze/vim-move'
"Plug 'unblevable/quick-scope'
Plug 'junegunn/seoul256.vim'
"Plug 'reedes/vim-pencil'
Plug 'nvie/vim-togglemouse'
Plug 'yuratomo/w3m.vim'
Plug 'wincent/command-t', {
 \ 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.fb && make'
 \ }
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjbach/lusty'
Plug 'dahu/vim-fanfingtastic'
Plug 'chrisbra/colorizer'
Plug 'haya14busa/incsearch.vim'
"Plug 'joeytwiddle/vim-seek'
call plug#end()

set laststatus=2
syntax enable
set incsearch
set timeoutlen=1000 ttimeoutlen=0
set display+=lastline
set hidden
set tabstop=2
set ignorecase
let g:CommandTAlwaysShowDotFiles=1 
let g:fanfingtastic_ignorecase = 1
"let g:seek_multi_line = 1
"let g:seek_noignorecase = 0
let g:LustyJugglerSuppressRubyWarning = 1

" Colour settings
"set background=dark
"colorscheme onedark
highlight CursorLine guibg=#F4F2F2 guifg=#FFF222
"#303030
highlight Cursor guibg=#626262
hi LineNr ctermfg=grey guifg=#2b506e guibg= #FFF000
:hi TabLineFill ctermfg=15 ctermbg=255
:hi TabLine ctermfg=232 ctermbg=253
" :hi TabLineSel ctermfg=Red ctermbg=Yellow
set cursorline
set relativenumber 
set number
set noswapfile

" Functions
function FindChar()
	let c = nr2char( getchar() )
	let match = search('\V' . c)
endfunction

function MyInsertEnterSettings()
	silent exec "! echo -ne '\e[1 q'"
	":hi CursorLine guibg=#303030
endfunction

function MyInsertLeaveSettings()
	silent exec "! echo -ne '\e[5 q'"
	":hi CursorLine guibg=#5f87af  
endfunction

" Normal #mode mappings
let mapleader="\<Space>"
vnoremap i gk
nnoremap i gk
vnoremap k gj
nnoremap k gj
onoremap i gk
onoremap k gj
nnoremap j <Left>
vnoremap j <Left>
vnoremap l <right>
nnoremap l <right>
onoremap j <Left>
onoremap l <right>
nnoremap o i
nnoremap O i
nnoremap h o
nnoremap H O
vnoremap o i
vnoremap O i
vnoremap h o
vnoremap H O
onoremap o i
onoremap O i
onoremap h o
onoremap H O

"let g:NERDTreeMapJumpNextSibling = "k"
"let g:NERDTreeMapJumpPrevSibling = "i"
"let g:NERDTreeMapOpenSplit = "h"
"nmap <leader>q call Getcolumns<CR>
nmap <leader>f :CommandTLine<CR>
"nmap q <Plug>fanfingtastic_F
nnoremap I <C-u>
nnoremap K <C-d>
"nmap q S
nnoremap q F
nnoremap F q
"nnoremap <C-u> 8k 
"nnoremap <C-d> 8j
nnoremap <esc>j J
nnoremap <leader>s s
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <leader>n :NERDTreeToggle<CR>
let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> <C-j> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-k> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-i> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>
nmap <F5> :windo set scrollbind!<cr>
" Copy to X CLIPBOARD
map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from X CLIPBOARD
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>
nnoremap <silent> <C-j> :wincmd h<cr>
nnoremap <silent> <C-k> :wincmd j<cr>
nnoremap <silent> <C-i> :wincmd k<cr>
nnoremap <silent> <C-l> :wincmd l<cr>

" Automatic commands
autocmd InsertLeave * :call MyInsertEnterSettings()
autocmd InsertEnter * :call MyInsertLeaveSettings()
autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd & 
