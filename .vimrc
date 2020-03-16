call plug#begin('~/.vim/plugins')
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
Plug 'zefei/vim-wintabs'
Plug 'gcmt/taboo.vim'
Plug 'moll/vim-bbye'
"Plug 'joeytwiddle/vim-seek'
call plug#end()

set laststatus=2
syntax enable
set incsearch
set timeoutlen=1000 ttimeoutlen=0
set display+=lastline
set hidden
set tabstop=2
set smartcase
let g:CommandTAlwaysShowDotFiles=1 
let g:fanfingtastic_ignorecase = 1
let g:wintabs_display = 'statusline'
"let g:seek_multi_line = 1
"let g:seek_noignorecase = 0
let g:LustyJugglerSuppressRubyWarning = 1

" Colour settings
"set background=dark
"colorscheme onedark
"highlight CursorLine guibg=#F4F2F2 guifg=#FFF222
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
set runtimepath+=~/.vim/bundle/bbye

"" Functions
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

"function MyTabSettingsOn()
"	:! i3-msg mode "default" 
"	map Undo gT
"	map Print gt	
"	map q :call MyTabSettingsOff()
"endfunction
"
"function MyTabSettingsOff()
"	:! i3-msg mode "." 
"	unmap Undo 
"	unmap Print 
"	" map "\<space>" :call MyTabSettingsOn()<CR>  
"endfunction

" Normal #mode mappings
"let mapleader="\<Space>"
let mapleader="\\"
vnoremap i gk
vnoremap k gj
vnoremap j <Left>
vnoremap l <right>
vnoremap o i
vnoremap O i
vnoremap h o
vnoremap H O

nnoremap i gk
nnoremap k gj
nnoremap j <Left>
nnoremap l <right>
nnoremap o i
nnoremap O i
nnoremap h o
nnoremap H O

onoremap j <Left>
onoremap l <right>
onoremap i gk
onoremap k gj
onoremap o i
onoremap O i
onoremap h o
onoremap H O

let NERDTreeMenuDown='k'
let NERDTreeMenuUp='i'
let NERDTreeMapOpenSplit='h'
let NERDTreeMapActivateNode='<Space>'
"nmap <leader>f :CommandTLine<CR>
"nmap q <Plug>fanfingtastic_F
nnoremap I <C-u>
nnoremap K <C-d>
"nmap q S
nnoremap q F
nnoremap F q
nnoremap <esc>j J
nnoremap <leader>s s
"nmap <space> :call TabMode()<CR>
imap <F9> <C-PageDown>
imap <F8> <C-PageUp>
nmap <F9> <C-PageDown>
nmap <F8> <C-PageUp>
imap <F3> <ESC>:WintabsPrevious<CR>
imap <F4> <ESC>:WintabsNext<CR>
nmap <F3> <ESC>:WintabsPrevious<CR>
nmap <F4> <ESC>:WintabsNext<CR>

"function TabMode()
"command! -nargs=1 Blahde execute ':silent !'.<q-args> | execute ':redraw!'
":Blahde i3-msg mode default > /dev/null &
"nmap <space> :call TabModeOff()<CR>
"endfunction
"
"function TabModeOff()
":Blahde i3-msg mode . > /dev/null &
"nmap <space> :call TabMode()<CR>
"endfunction
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map <leader>n :NERDTreeToggle<CR>
map <PageUp> <C-u>
map <PageDown> <C-d>
" Copy to X CLIPBOARD
map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>
nnoremap <silent> <C-j> :wincmd h<cr>
nnoremap <silent> <C-k> :wincmd j<cr>
nnoremap <silent> <C-i> :wincmd k<cr>
nnoremap <silent> <C-l> :wincmd l<cr>
inoremap kj <Esc>
" inoremap <Esc> <Nop>

" Automatic commands
 autocmd InsertLeave * call MyInsertEnterSettings()
 autocmd InsertEnter * :call MyInsertLeaveSettings()
 autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
 " autocmd BufWritePost *sxhkdrc !killall sxhkd; setsid sxhkd & 
