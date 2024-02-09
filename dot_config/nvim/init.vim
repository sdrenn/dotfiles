" THIS IS SYNCED VERSION
" Langmap
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz,Жю;:.
cmap Ф A
cmap И B
cmap С C
cmap В D
cmap У E
cmap А F
cmap П G
cmap Р H
cmap Ш I
cmap О J
cmap Л K
cmap Д L
cmap Ь M
cmap Т N
cmap Щ O
cmap З P
cmap Й Q
cmap К R
cmap Ы S
cmap Е T
cmap Г U
cmap М V
cmap Ц W
cmap Ч X
cmap Н Y
cmap Я Z
cmap ф a
cmap и b
cmap с c
cmap в d
cmap у e
cmap а f
cmap п g
cmap р h
cmap ш i
cmap о j
cmap л k
cmap д l
cmap ь m
cmap т n
cmap щ o
cmap з p
cmap й q
cmap к r
cmap ы s
cmap е t
cmap г u
cmap м v
cmap ц w
cmap ч x
cmap н y
cmap я z

" Clipboard
set clipboard+=unnamedplus

" CAPS LOCK -> ESC (Включается при входе и выключается при выходе)
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
map! jj <ESC>
map! оо <ESC>

" Scroll
map <C-j> <C-d> 
map <C-k> <C-u> 

" Leader
let mapleader=","

lua require('configs.config')
lua require('configs.lsp')
lua require('configs.pcmp')
lua require('configs.remap')
lua require('configs.set')

" Telescope
nnoremap <leader>fd <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Text wrap
" nnoremap <leader>w <cmd>set invwrap<cr>
nnoremap <leader>w :w<CR>

" NERDTree
" nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>n <C-w>w
nmap <TAB> gt
nmap <leader>mm :tabclose<CR>
nmap <leader>wq :wqall<CR>
nmap <leader>qq :qall!<CR>
nnoremap <leader>wf <C-W>_
nnoremap <leader>ws <C-w>=
" let NERDTreeMapCustomOpen='l'

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
