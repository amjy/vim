" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages availablein Debian.
" debian.vim
"

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets'nocompatible'. Setting'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
set nocompatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
    syntax on
endif

" detect file type
filetype on
filetype plugin on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"")<= line("$")| exe "normal! g'\"" | endif
    "have Vim load indentation rules and plugins accordingto the detected filetype
    filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

set autowrite
set noautoindent
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set shiftwidth=4
set noswapfile

"set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s

set showmatch
set linebreak
set whichwrap=b,s,<,>,[,]

set mouse=a           " Enable mouse usage (all modes)
set number            " Enable line number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

set history=50        " set command history to 50

"-- status line set --
set laststatus=2
set ruler

"-- command line set --
set showcmd
set showmode

"-- find setting --
set incsearch
set hlsearch

"-- ctags setting --
map <F4> :!ctags -R -f .tags --c-kinds=+p --fields=+iaS --extra=+q <CR><CR>:TlistUpdate<CR>
imap <F4> <ESC>:!ctags -R -f .tags --c-kinds=+p --fields=+iaS --extra=+q <CR><CR>:TlistUpdate<CR>

set tags=.tags
set updatetime=100
set cscopetag

"-- Tagbar setting --
nmap tb :TagbarToggle<cr>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_left=0
let g:tagbar_width=40
let g:tagbar_sort = 0
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.go,*.lua,*.py call tagbar#autoopen()

"-- WinManager setting --
let g:persistentBehaviour=0
let g:winManagerWidth=32
nmap wm :WMToggle<cr>

"-- minibufexpl setting --
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
hi MBENormal cterm=NONE ctermbg=white ctermfg=NONE
nnoremap <silent> bn :bn<Cr>
nnoremap <silent> bp :bp<Cr>
nnoremap <silent> bb :b#<Cr>
nmap <silent> Q :bd<Cr>:syn on<CR>bn

"-- disable F1 help --
map <F1> <Nop>
imap <F1> <Nop>

"-- hightlight setting --
noremap <silent> <F2> gd<C-o>
inoremap <silent> <F2> <ESC> gd<C-o>

" clear hightlight
noremap <silent> <F2><F2> :nohl<CR>
inoremap <silent> <F2><F2> <ESC> :nohl<CR>

"-- hightlight current line --
"hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE
set cursorline
autocmd InsertEnter * :set nocursorline
autocmd InsertLeave * :set cursorline

"-- for docker
colorscheme default

"-- auto autocomplete color --
hi Pmenu ctermfg=black ctermbg=lightgray
hi PmenuSel ctermbg=blue ctermfg=white

"-- omnicppcomplete setting --
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_LocalSearchDecl=1

"-- supertab setting --
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"-- grep setting --
nnoremap <silent> <F3> :Grep -nr<CR><CR><CR>
nnoremap <silent> <F3><F3> :cclose<Cr>

"-- cscope setting --
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"-- crtlp setting --
"let g:ctrlp_map = '<leader>p'
let g:ctrlp_map = 'fp'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(tags|swp|exe|o|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"-- ctrlp-funky setting --
"nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

"-- save session, save file and quit vim --
noremap ms :mks! .session.vim<CR>
