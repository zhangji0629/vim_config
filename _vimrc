" 避免与原有的plugin冲突
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" golang 自己的自动补全
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" golang的模糊查询的插件,使用方式:Files
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" 搜索文字
Plug 'mileszs/ack.vim'
" buffer区展示 \be 打开历史, \bv 垂直新建边栏 \bs水平新建边栏
Plug 'jlanzarotta/bufexplorer'
" 代码提示
Plug 'Blackrush/vim-gocode'
" 边栏
Plug 'majutsushi/tagbar'
" 符号补全
Plug 'Raimondi/delimitMate'
" 颜色主题
Plug 'morhetz/gruvbox'
"快速注释
Plug 'scrooloose/nerdcommenter'
" 优化搜索，移动清除搜索高亮
Plug 'junegunn/vim-slash'        
"括号,引号自动匹配
Plug 'jiangmiao/auto-pairs'
"protodef支持
Plug 'derekwyatt/vim-protodef'

Plug 'Lokaltog/vim-powerline'
Plug 'Yggdroot/indentLine'
Plug 'tell-k/vim-autopep8'

Plug 'shougo/neocomplete.vim'

"vim-python相关
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim'

"代码折叠插件
Plug 'tmhedberg/SimpylFold'

"cpp补全
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer',  'for': ['c', 'cpp'] }

" 初始化
call plug#end()

set backspace=indent,eol,start  " 智能回删
set whichwrap+=h,l,<,>,[,]      " 光标循环
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set cindent     "（cindent是特别针对 C语言语法自动缩进）
set encoding=utf-8  "设置utf-8编码

set tabstop=4 "控制插入 Tab 時所需要的空白鍵(Tab)字元數
set shiftwidth=4 "控制程式縮排所需要的 Space 個數
set backspace=2 " 设置退格键可用
" 设置缩进
set autoindent
set smartindent

set relativenumber           " 开启相对行号
set nu! "关闭行号
set ruler                    " 显示光标所在的行列值
set incsearch "输入字符之后,马上查找
set hlsearch " 查找之后的高亮显示
set ignorecase            " 搜索忽略大小写
set nowrapscan " 查找结束之后不循环查找
set nocompatible " 关闭与vi的兼容
set hidden " 防止误删除,将文件放在内存buffer
set foldmethod=indent " 按照缩进来折叠
set foldlevel=100 " 设置折叠的最大值
set laststatus=2 " 打开底部状态栏
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set cmdheight=2 " 命令行展示的高度,显示到2
set autoread " 外部改变的时候,自动更新
set nobackup " 不生成备份文件
set noswapfile " 不生成交换文件
set list " 显示可见字符,避免被坑
" Tab使用高亮~代替，尾部空白使用高亮点号代替
set listchars=tab:\~\ ,trail:.
set expandtab "将tab转化为空格
set showmatch " 显示括号配对情况

set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8
set fileformat=unix
set fileformats=unix,mac,dos

" 文件未保存提示
set confirm
set autochdir                " 设定文件浏览器目录为当前目录

syntax on " 自动语法高亮

"检测文件类型  
filetype on  
" 针对不同的文件类型采用不同的缩进格式    
filetype indent on                 
"允许插件    
filetype plugin on  
"启动自动补全  
filetype plugin indent on

"键位映射
"前缀代表生效范围
"inoremap就只在插入(insert)模式下生效
"vnoremap只在visual模式下生效
"nnoremap就在normal模式下(狂按esc后的模式)生效
" 代码提示
imap <C-u> <C-x><C-o>

" 通用定义
nmap <C-l> :TagbarToggle<CR>
nmap <C-b> :buffers<CR>

" 专门给go的定义
au FileType go nmap <C-j> :GoDef<CR>
au FileType go nmap <C-i> :GoInfo<CR>

" \c                  复制至公共剪贴板
vmap <leader>c "+y

" \a                  复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>

" \v                  从公共剪贴板粘贴
imap <leader>v <esc>"+p
nmap <leader>v "+p
vmap <leader>v "+p


" NERDTree 配置
" 关闭NERDTree快捷键 \t打开
map <leader>t :NERDTreeToggle<CR>
au VimEnter * NERDTree
"" vim 是一个文件夹的时候,打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" 打开文件不打开nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeClose |endif
" 显示行号
let NERDTreeShowLineNumbers=1
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$', '\.pioenvs$', '\.swp']
" 设置宽度
let NERDTreeWinSize=31
" 显示书签列表
let NERDTreeChDirMode = 1
let NERDTreeShowBookmarks=1
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

" 定义
let g:ackprg = 'ag --nogroup --nocolor --column'

" go 定义
let g:go_template_autocreate              = 1  " 打开自动生成模版代码
let g:go_auto_type_info                   = 1  " 打开 Go 语言自动显示类型信息 [默认就是关闭的，此处用于方便需要时开启]
let g:go_def_mapping_enabled              = 1  " 打开 Go 语言对gd的绑定
let g:go_highlight_operators              = 1  " 开启 Go 语言操作符高亮
let g:go_highlight_functions              = 1  " 开启 Go 语言函数名高亮
let g:go_highlight_methods                = 1  " 开启 Go 语言方法名高亮
let g:go_highlight_structs                = 1  " 开启 Go 语言结构体名高亮
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" 设置主题
set background=dark
colorscheme gruvbox

" FZ配置
let g:fzf_layout = { 'down': '~35%' }
nnoremap <C-F>      :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fc :Colors<CR>
nnoremap <Leader>fh :History<CR>
nnoremap <Leader>fl :Lines<CR>
nnoremap <Leader>fm :Commands<CR>

" \rr        一键保存、编译、运行
imap <leader>rr <esc>:call Compile_Run_Code()<cr>
nmap <leader>rr :call Compile_Run_Code()<cr>
vmap <leader>rr <esc>:call Compile_Run_Code()<cr>

function! Compile_Run_Code()
    exec "w"
    if &filetype is 'java'
        exec "!javac\ -d\ .\ %"
        exec "!java\ %<"
    elseif &filetype is 'cpp'|| &filetype == 'c'
        exec "!g++ -std=c++1y % -o %<"
        exec "!./%<"
    elseif &filetype is "python"
        exec "!python3.5 %"
    elseif &filetype is "go"
        exec "!go run %"
    endif
endfunction


"YouCompleteMe
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"youcompleteme  默认tab  s-tab 和自动补全冲突
""let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0 
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1 
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2 
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0  
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"force recomile with syntastic
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"代码折叠
let g:SimpylFold_docstring_preview=1

"实时代码补全
let g:neocomplete#enable_at_startup = 1

"python代码缩进PEP8风格
au BufNewFile,BufRead *.py,*.pyw set tabstop=4 
au BufNewFile,BufRead *.py,*.pyw set softtabstop=4 
au BufNewFile,BufRead *.py,*.pyw set shiftwidth=4 
au BufNewFile,BufRead *.py,*.pyw set textwidth=79 
au BufNewFile,BufRead *.py,*.pyw set expandtab 
au BufNewFile,BufRead *.py,*.pyw set autoindent 
au BufNewFile,BufRead *.py,*.pyw set fileformat=unix
