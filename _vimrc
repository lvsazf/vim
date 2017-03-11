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
set nobackup      " 覆盖文件时不备份
set noundofile
set noswapfile
set nocompatible "去掉一致性检查
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu
if has("gui_running")
set guioptions-=m " 隐藏菜单栏
set guioptions-=T " 隐藏工具栏
set guioptions-=L " 隐藏左侧滚动条
set guioptions-=r " 隐藏右侧滚动条
endif
" 配色方案
"set background=dark
syntax enable
set background=light
set t_Co=256
colorscheme solarized
set lines=55 columns=180       "设置窗口默认大小
"   设置winmanager
"   设置界面分割
let g:winManagerWindoLayout = "TagList|FileExplorer"
"   设置winmanager的宽度，默认是25
let g:winManagerWidth = 1000
"   定义打开关闭winmanager快捷键位F8
nmap <silent> <F8> :WMToggle<cr>
"   在进入im时自动打开winmanager
let g:AutoOpenWinManager = 1
autocmd InsertLeave * se nocul  "用浅色高亮当前行
autocmd InsertLeave * se cul    "用浅色高亮当前行
set guifont=Courier_New:h10:cANSI   "设置字体
set textwidth=200
set ruler       "显示标尺
set showcmd     "输入的命令显示出来，看得清除些
set cmdheight=1    "命令行（在状态行下）的高度，设置为1
set novisualbell    "不要闪烁（这是什么鬼,并不是很清楚？没有发现区别）
set helplang=cn "显示中文帮助
set autowrite
set cursorline  "突出显示当前行
"自动缩进
set autoindent
set cindent
"Tab键的宽度
set tabstop=4
"统一缩进为4
set softtabstop=4
set shiftwidth=4
"映射全选+赋值 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
"选中状态下 ctrl+c复制
vmap <C-c> "+y
"新建标签
map <M-F2> :tabnew<CR>
"列出当前目录文件
map <F3> :tabnew .<CR>
"打开树状文件目录
map <C-F3> \be
"禁用方向键
map <UP> <NOP>
map <DOWN> <NOP>
map <LEFT> <NOP>
map <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
inoremap <LEFT> <NOP>
inoremap <RIGHt> <NOP>
"字体
"if (has("gui_running"))
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif
set rtp+=D:/dev/.vim/bundle/vundle
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
"Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
call vundle#end()
filetype plugin indent on
"------------------------------------------------------------------------------------------------------------------
"set foldenable  "允许折叠
"set foldmethod=indent
"au BufWinLeave * silent mkview  " 保存文件的折叠状态
"au BufRead * silent loadview    " 恢复文件的折叠状态
nnoremap <space> za             " 用空格来切换折叠状态
"------------------------------------------------------------------------------------------------------------------
" Ctrl+N 打开/关闭
map <C-n> :NERDTreeToggle<CR>
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

function Xml()
   set filetype=w
    :%s/>
     </>\r</g
     :normal gg=G<cr>
endfunction
map <leader>xml :call Xml()

" toggle fullscreen mode by pressing F11
noremap <f11> <esc>:call libcallnr('gvim_fullscreen.dll', 'ToggleFullscreen', 0)<cr>
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim