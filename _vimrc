source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
let $PYTHONHOME='D:\dev\Python36-32'
set pythondll=
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

"------------------------------------------------------------------------
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set nu!							" show line number
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
syntax on                       " turn syntax highlighting on by default
set shortmess=atI   			" 启动的时候不显示那个援助乌干达儿童的提示
"color ron     					" set background color
set fileencodings=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set encoding=utf-8
set encoding=cp936
set nobackup      "覆盖文件时不备份
set noundofile
set noswapfile
set winaltkeys=no " 设置 alt 键不映射到菜单栏 
set nocompatible "去掉一致性检查
filetype on  " 开启文件类型侦测

filetype plugin on  " 根据侦测到的不同类型加载对应的插件
autocmd BufWritePost $MYVIMRC source $MYVIMRC  " 让配置变更立即生效
set incsearch " 开启实时搜索功能
set ignorecase  " 搜索时大小写不敏感
set wildmenu     " vim 自身命令行模式智能补全
if has("gui_running")
set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
endif
"set background=dark
syntax enable
set background=light                    " 配色方案
set t_Co=256
colorscheme solarized                   "设置配色方案
set lines=55 columns=180       	        "设置窗口默认大小
"   设置winmanager
"   设置界面分割
let g:winManagerWindoLayout = "TagList|FileExplorer"
let g:winManagerWidth = 1000            "设置winmanager的宽度，默认是25
let g:AutoOpenWinManager = 1            "在进入im时自动打开winmanager
autocmd InsertLeave * se nocul          "用浅色高亮当前行
autocmd InsertLeave * se cul            "用浅色高亮当前行
set guifont=Courier_New:h10:cANSI       "设置字体
set textwidth=800                       
set ruler                               "显示标尺
set showcmd                             "输入的命令显示出来，看得清除些
set cmdheight=1                         "命令行（在状态行下）的高度，设置为1
set novisualbell                        "不要闪烁（这是什么鬼,并不是很清楚？没有发现区别）
set helplang=cn                         "显示中文帮助
set autowrite                           "自动保存
set cursorline                          "突出显示当前行
set autoindent                          "自动缩进
set cindent                             
set tabstop=4                           "Tab键的宽度
set softtabstop=4                       "统一缩进为4
set shiftwidth=4	
set history=1000                        "历史记录数
set tabpagemax=15						"设置标签页数量
set completeopt=longest,menu            ""打开文件类型检测, 加了这句才可以用智能补全
"-----------------------------------------快捷键映射-----------------------------------------
nmap <silent> <F8> :WMToggle<cr>        "定义打开关闭winmanager快捷键位F8
"映射全选+赋值 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
vmap <C-c> "+y                          "选中状态下 ctrl+c复制
map <M-F2> :tabnew<CR>                  "新建标签
map <F3> :tabnew .<CR>                  "列出当前目录文件
"打开树状文件目录
map <C-F3> \be
"禁用方向键
"map <UP> <NOP>
"map <DOWN> <NOP>
"map <LEFT> <NOP>
"map <RIGHT> <NOP>
"inoremap <UP> <NOP>
"inoremap <DOWN> <NOP>
"inoremap <LEFT> <NOP>
"inoremap <RIGHt> <NOP>
" 插入模式移动光标 alt + 方向键 
"inoremap <M-j> <Down> 
"inoremap <M-k> <Up> 
"inoremap <M-h> <left> 
"inoremap <M-l> <Right>

"字体
"if (has("gui_running"))
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif
set rtp+=D:/dev/.vim/bundle/Vundle.vim
call vundle#begin('D:/dev/.vim/bundle/vimfiles/bundle/')
Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Bundle 'jQuery'
Plugin 'altercation/vim-colors-solarized'
"Bundle 'vhdirk/vim-cmake'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tmhedberg/SimpylFold' "代码智能折叠
Plugin 'scrooloose/nerdtree' "项目树
"Plugin 'Xuyuanp/nerdtree-git-plugin' " 这个插件可以显示文件的Git增删状态
Plugin 'kien/ctrlp.vim' "全局搜索
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/AutoComplPop' " 自动补全
Plugin 'Lokaltog/vim-powerline' "状态栏插件
Plugin 'vim-scripts/indentpython.vim' 
Plugin 'scrooloose/nerdcommenter'  " 快速注释
Plugin 'scrooloose/syntastic'     " 多语言语法检查
Plugin 'vim-scripts/Pydiction' " ##### Python 代码补全
Plugin 'Raimondi/delimitMate'   " ###### 自动补全单引号，双引号等
call vundle#end()
filetype plugin indent on

"---------------------------------------vim-scripts/Pydiction------------------------------------------------------
let g:pydiction_location = 'D:/dev/.vim/bundle/vimfiles/bundle/Pydiction/complete-dict'
"---------------------------------------scrooloose/syntastic-------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='✘✘'
let g:syntastic_warning_symbol='➤➤'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
     " 使用pyflakes,速度比pylint快
let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
    " 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
map <F11> <Esc>:call CheckPythonSyntax()<CR>
nnoremap <s>:call ToggleErrors()<CR>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>
"-------------------------------------scrooloose/nerdcommenter-----------------------------------------------------
" <leader>cc 注释选中内容
" <leader>cu 取消选中注释
" <leader>c$ 从当前光标开始到行尾注释掉
let g:NERDSpaceDelims=1
"------------------------------------------------------------------------------------------------------------------
"set foldenable  "允许折叠
"set foldmethod=indent
"au BufWinLeave * silent mkview  " 保存文件的折叠状态
"au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
"-----------------------------------------scrooloose/nerdtree------------------------------------------------------
" F2 打开/关闭
nmap <F2> :NERDTreeToggle<CR>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
"nnoremap <C-J> <C-W><C-J>
"窗口分割时,进行切换的按键热键需要连接两次,比如从下方窗口移动 
"光标到上方窗口,需要<c-w><c-w>k,非常麻烦,现在重映射为<c-k>,切换的 
"时候会变得非常方便. 
nmap <C-h> <C-w>h 
nmap <C-j> <C-w>j 
nmap <C-k> <C-w>k 
nmap <C-l> <C-w>l
"------------------------------------------------------------------------------------------------------------------
"kien/ctrlp.vim 一些配置
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
"------------------------------------pangloss/vim-javascript--------------------------------------------------------
let g:javascript_plugin_jsdoc = 1


"------------------------------------------------------------------------------------------------------------------
" =====================
" 多语言环境
" 默认为 UTF-8 编码
" =====================
if has("multi_byte")
    set encoding=utf-8
    " English messages only
    "language messages zh_CN.utf-8
  
    if has('win32')
        language english
        let &termencoding=&encoding
    endif
  
    set fencs=ucs-bom,utf-8,gbk,cp936,latin1
    set formatoptions+=mM
    set nobomb " 不使用 Unicode 签名
  
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif
"---------------------------------------------------------------------------------------------------

" toggle fullscreen mode by pressing F11
noremap <f11> <esc>:call libcallnr('gvim_fullscreen.dll', 'ToggleFullscreen', 0)<cr>
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"---------------------------------------------------------------------------------------------------
function CheckPythonSyntax() 
    let mp = &makeprg 
    let ef = &errorformat 
    let exeFile = expand("%:t") 
    setlocal makeprg=python\ -u 
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
    silent make % 
    copen 
    let &makeprg     = mp 
    let &errorformat = ef 
endfunction
map <F11> <Esc>:call CheckPythonSyntax()<CR>

"au filetype python map <F6>  :w <CR> :call CheckPythonSyntax() <CR>
"au filetype python imap <F6> <ESC> :w <CR> :call CheckPythonSyntax() <CR>
"---------------------------python支持PEP8风格---------------------------------------------------------
set expandtab
set fileformat=unix