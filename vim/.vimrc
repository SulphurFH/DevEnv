"leader
let mapleader="\\"

""检测操作系统
if(has("win32") || has("win95") || has("win64") || has("win16"))
  let g:iswindows=1
else
  let g:iswindows=0
endif  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F2-F10快捷键绑定
"<F2>按下F2行号开关，用于鼠标复制代码用
"<F3>按下F3调出/隐藏 NERDTree
"<F4>按下F4调出/隐藏 LeaderfFile
"F6>在python文件添加头部
"<F8>自动使用autopep8格式化当前文件
"<F10>无须重启即使vimrc配置生效
"<F12>generate ctags for current folder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 为方便复制，用<F2>开启/关闭行号显示:
function! HideNumber()
  if(&relativenumber == &number)
    set number!
  elseif(&number)
    set number!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
"<F3> 按下F3调出/隐藏 NERDTree
map <F3> :NERDTreeToggle<CR>
"<F4> 按下F4调出/隐藏 Tagbar
map <F4> :LeaderfFile<CR>
"<F6> 添加头部作者等信息
nmap <F6> :call SmartAddHeader()<CR>
function! SmartAddHeader()
    if &filetype=="python"
        normal gg
        normal O
        normal O
        call setline(1, "# -*- coding: utf-8 -*-")
        normal 3j
    endif
endf

"<F8>  vim-autopep8
autocmd FileType python map <buffer> <F8> :call Autopep8()<CR><C-l><CR>

"<F10> 改变.vimrc后无须重启vi即生效
map <F10> :w<cr>:so %<cr>

" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 关闭方向键, 强迫自己用 hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 外观设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax
syntax on
" colors
colorscheme onedark 

" 设置行间距
" font
if g:iswindows 
    set linespace=1
    set guifont=Lucida\ Console:h13
else 
    set guifont=Monaco\ for\ Powerline:h16
endif

" 设置高亮当前行
set cursorline

" 下面5行用来解决gVim菜单栏和右键菜单乱码问题
set encoding=utf8
set langmenu=zh_CN.UTF-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=m "不显示菜单. 
set guioptions-=T "不显示工具栏
" 解决gVim中提示框乱码
language message zh_CN.UTF-8

" 设定默认解码
set fileencodings=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

set colorcolumn=120

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 切换buffer时不提示未保存的修改
set hidden

" 当buffer被丢弃的时删除它
set bufhidden=hide

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=inclusive
set selectmode=key

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

"""""""""""""""""""""""""""""""""""""""""
""Fuzzyfinder
nmap ff :FufFile<CR>
nmap fb :FufBuffer<CR>
"""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" filetype
filetype on
filetype plugin on

set fileformat=unix

" 不备份，不生成临时文件
set nobackup
set nowritebackup
set noswapfile

" 增强模式中的命令行自动完成操作
set wildmenu

" 在状态行上显示光标所在位置的行号和列号
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=2

" 在搜索的时候忽略大小写
set ignorecase

" 不要高亮被搜索的句子（phrases）
set hlsearch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 不要闪烁
set novisualbell

" statusline
"set statusline=\ %F%m%r%h%w\ %=\ [pos:%l:%v:%p%%]\ [%{&ff}\ %{&fenc!=''?&fenc:&enc}]\ \ [type:%Y]\ \  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent
" 为C程序提供自动缩进
set smartindent
"cindent:Vim可以很好的识别出C和Java等结构化程序设计语言，
"并且能用C语言的缩进格式来处理程序的缩进结构
set cindent

" 具体编辑文件类型的一般设置，比如不要 tab 等
autocmd FileType python,sh set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai

" 自动折行显示(只是显示)
set wrap

" vimdiff忽略行尾的空格(自然包括全空格的行)
set diffopt+=iwhite

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"保证工作目录为当前目录,
autocmd BufEnter * execute ":silent! lcd " . expand("%:p:h")

" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
autocmd FileType xml,html,sh,bash,python,vim,markdown,javascript set number
autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
"设置自动断行
"autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
"autocmd Filetype html,xml,xsl source $VIMRUNTIME/plugin/closetag.vim
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif
endif " end has("autocmd")

" 能够漂亮地显示.NFO文件
set encoding=utf-8 fileencodings=ucs-bom,utf-8,gbk,cp936
function! SetFileEncodings(encodings)
let b:myfileencodingsbak=&fileencodings
let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
let &fileencodings=b:myfileencodingsbak
unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" 用空格键来开关折叠
set foldenable
set foldmethod=manual
autocmd FileType python setlocal foldmethod=indent
set foldlevel=99
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" auto remove trailing whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""插件开始""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""lightline 
set laststatus=2
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-autopep8
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=120
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""emmet-vim
"Enable just for html/css/jsx
let g:user_emmet_install_global = 0
autocmd FileType html,htmldjango,css,jsx EmmetInstall
"enable all function in all mode.
let g:user_emmet_mode='a'
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""nerdtree
" 在vim启动的时候默认开启并切换编辑页面 
autocmd VimEnter * if !argc() | NERDTree | endif
wincmd w
autocmd VimEnter * wincmd w
" 关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" " 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" " 是否显示隐藏文件
let NERDTreeShowHidden=1
" " 设置宽度
let NERDTreeWinSize=31
" " 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" " 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.DS_Store','.vscode','__pycache__','.git']
" " 显示书签列表
let NERDTreeShowBookmarks=1
" " 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
"" NERDTreeTabsToggle
let g:nerdtree_tabs_open_on_console_startup=1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-bookmarks
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""UltiSnips snippet engine
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""neocomplete
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3 
" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1 

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
            "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
 autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
 autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
 autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
 autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
 autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" disable docstrings popup
 set completeopt-=preview
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""jedi-vim
" If you are a person who likes to use VIM-buffers not tabs
let g:jedi#use_tabs_not_buffers = 0
" disable docstrings popup
autocmd FileType python setlocal completeopt-=preview

" use neocomplcache with jedi-vim
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python =
            \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
 ""syntastic
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E501,E265,F403,E402"
let g:syntastic_html_tidy_ignore_errors = [
            \  'plain text isn''t allowed in <head> elements',
            \  '<base> escaping malformed URI reference',
            \  'discarding unexpected <body>',
            \  '<script> escaping malformed URI reference',
            \  '</head> isn''t allowed in <body> elements',
            \  '<a> escaping malformed URI reference',
            \ ]
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""PreserveNoEOL
let g:PreserveNoEOL = 1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-easymotion
map <Leader> <Plug>(easymotion-prefix)

map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""vim-markdown
let g:vim_markdown_folding_disabled=1
""vim-instant-markdown
let g:instant_markdown_slow = 1
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""
""ctrlsf.vim
map f <Plug>CtrlSFPrompt
map F <Plug>CtrlSFQuickfixPrompt
"""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""

""vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'itchyny/lightline.vim'
Plugin 'gmarik/vundle'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'elzr/vim-json'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'easymotion/vim-easymotion'
Plugin 'pangloss/vim-javascript'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Yggdroot/LeaderF'

" vim-scripts repos on vim.org
Plugin 'L9'
Plugin 'colorizer'
Plugin 'LargeFile'
Plugin 'PreserveNoEOL'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

