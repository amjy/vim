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
    syntax on            " 语法高亮
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

set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set noautoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
set smartindent        " 智能对齐方式
set tabstop=4        " 设置制表符(tab键)的宽度
set softtabstop=4     " 设置软制表符的宽度    
set expandtab         " 设置空格代替tab
set smarttab          " backspace删除4个空格
set shiftwidth=4    " (自动) 缩进使用的4个空格
"set cindent            " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
"set backspace=2    " 设置退格键可用
set showmatch        " 设置匹配模式，显示匹配的括号
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
"set hidden " Hide buffers when they are abandoned
set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
set number            " Enable line number    "显示行号
"set previewwindow    " 标识预览窗口
set history=50        " set command history to 50    "历史记录50条

"--状态行设置--
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler            " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--
set showcmd            " 命令行显示输入的命令
set showmode        " 命令行显示vim当前模式

"--find setting--
set incsearch        " 输入字符串就显示匹配点
set hlsearch        

"--ctags setting--
map <F5> :!ctags -R -f .tags --c-kinds=+p --fields=+iaS --extra=+q --language-force=C . <CR><CR>:TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R -f .tags --c-kinds=+p --fields=+iaS --extra=+q --language-force=C .<CR><CR>:TlistUpdate<CR>
set tags=.tags

"-- Taglist setting --
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=1 "实时更新tags,是否一直处理tags.1:处理;0:不处理
let Tlist_Inc_Winwidth=1
let Tlist_WinWidth=40
set updatetime=100  "设置taglist更新时间100毫秒
nmap tl :Tlist<cr>

"-- WinManager setting --
let g:winManagerWindowLayout='FileExplorer|TagList' " 设置我们要管理的插件
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
let g:winManagerWidth=40
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

"-- hightlight setting --
" 高亮当前关键字
noremap <silent> <F2> gd<C-o>
inoremap <silent> <F2> <ESC> gd<C-o>

" 取消当前高亮
noremap <silent> <F2><F2> :nohl<CR>
inoremap <silent> <F2><F2> <ESC> :nohl<CR>

set cursorline " 高亮当前行
hi CursorLine cterm=NONE ctermbg=darkgray ctermfg=NONE

" 设置自动补齐背景颜色
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

" -- keys maps
map <F4> :set paste<Cr>i

