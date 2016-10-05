set nocompatible "required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'ap/vim-css-color'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-unimpaired'
Plugin 'fatih/vim-go'
Plugin 'gmarik/Vundle.vim'

call vundle#end() "required
filetype on "required
filetype plugin indent on

" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"alt+arrow key to move between vim windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

colorscheme molokai
set clipboard=unnamed
set clipboard=unnamedplus
set guifont=Consolas:h12
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set hlsearch
set incsearch
set lazyredraw
set showmatch
set mat=2
syntax enable
set shiftwidth=4
set tabstop=4
set t_Co=256
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set vb
set so=6
"set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set runtimepath^=~/.vim/bundle/ctrlp.vim
filetype plugin on
filetype plugin indent on
set wildmenu
set hid
syntax on
"Set the status line options. Make it show more information.
set laststatus=2
set nocompatible
set nobackup            " Do not keep a backup file, use versions instead
set noswapfile          " Kind of the same as above, no swap file for backups
set laststatus=2 		" Two lines for status (so airline plugin is useful)
set foldmethod=indent   " Use indent code folding
set foldlevelstart=20   " Don't indent files on open
set splitbelow          " Change default split position
set splitright          " Change default split position
set suffixes=.bak,~,.o,.h,.info,.swp,.class

if has('mouse')
	set mouse=a
endif

  " Removes trailing spaces
function TrimWhiteSpace()
	%s/\s*$//
''
	:endfunction
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>


"set runtimepath+=~/.vim/bundle/jshint2.vim/


"indent plugin settings
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

" remove white space
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
"NerdTree
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
map <C-n> :NERDTreeToggle<CR>

let g:nerdtree_tabs_open_on_console_startup=1

" Map Ctrl+z to close a buffer without closing the split window
nnoremap <C-z> :bp\|bd #<CR>
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Don't display these kinds of files
let NERDTreeIgnore=['\~$', '\.pyc', '\.swp$', '\.git', '\.hg', '\.svn', '\.class',
      \ '\.ropeproject', '\.o', '\.bzr', '\.ipynb_checkpoints$',
      \ '__pycache__',
      \ '\.egg$', '\.egg-info$', '\.tox$', '\.idea$', '\.sass-cache',
      \ '\.env$', '\.env[0-9]$', '\.coverage$', '\.tmp$', '\.gitkeep$',
      \ '\.coverage$', '\.webassets-cache$', '\.vagrant$', '\.DS_Store',
      \ '\.env-pypy$']

let g:vimfiler_ignore_pattern='\%(.ini\|.sys\|.bat\|.BAK\|.DAT\|.pyc\|.egg-info\)$\|'.
  \ '^\%(.gitkeep\|.coverage\|.webassets-cache\|.vagrant\|)$\|'.
  \ '^\%(.env\|.ebextensions\|.elasticbeanstalk\|Procfile\)$\|'.
  \ '^\%(.git\|.tmp\|__pycache__\|.DS_Store\|.o\|.tox\|.idea\|.ropeproject\)$'

set wildignore=*.o,*.obj,*~,*.pyc,*.class "stuff to ignore when tab completing
set wildignore+=.env
set wildignore+=.env[0-9]+
set wildignore+=.env-pypy
set wildignore+=.git,.gitkeep
set wildignore+=.tmp
set wildignore+=.coverage
set wildignore+=*DS_Store*
set wildignore+=.sass-cache/
set wildignore+=__pycache__/
set wildignore+=.webassets-cache/
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=.tox/**
set wildignore+=.idea/**
set wildignore+=.vagrant/**
set wildignore+=.coverage/**
set wildignore+=*.egg,*.egg-info
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/.rbenv/**
set wildignore+=*/.nx/**,*.app

let g:netrw_list_hide='\.o,\.obj,*\~,\.pyc,\.class' "stuff to ignore when tab completing
let g:netrw_list_hide.='\.env,'
let g:netrw_list_hide.='\.env[0-9].,'
let g:netrw_list_hide.='\.env-pypy,'
let g:netrw_list_hide.='\.git,'
let g:netrw_list_hide.='\.gitkeep,'
let g:netrw_list_hide.='\.vagrant,'
let g:netrw_list_hide.='\.tmp,'
let g:netrw_list_hide.='\.coverage$,'
let g:netrw_list_hide.='\.DS_Store,'
let g:netrw_list_hide.='__pycache__,'
let g:netrw_list_hide.='\.webassets-cache/,'
let g:netrw_list_hide.='\.sass-cache/,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='vendor/rails/,'
let g:netrw_list_hide.='vendor/cache/,'
let g:netrw_list_hide.='\.gem,'
let g:netrw_list_hide.='\.ropeproject/,'
let g:netrw_list_hide.='\.coverage/,'
let g:netrw_list_hide.='log/,'
let g:netrw_list_hide.='tmp/,'
let g:netrw_list_hide.='\.tox/,'
let g:netrw_list_hide.='\.idea/,'
let g:netrw_list_hide.='\.egg,\.egg-info,'
let g:netrw_list_hide.='\.png,\.jpg,\.gif,'
let g:netrw_list_hide.='\.so,\.swp,\.zip,/\.Trash/,\.pdf,\.dmg,/Library/,/\.rbenv/,'
let g:netrw_list_hide.='*/\.nx/**,*\.app'

try
	" Set up some custom ignores
	call unite#custom#source('buffer,file,file_rec/async,file_rec,file_mru,file,grep',
				\ 'ignore_pattern', join([
				\ '\.DS_Store',
				\ '\.class',
				\ '\.tmp/',
				\ '\.git/',
				\ '\.gitkeep',
				\ '\.hg/',
				\ '\.tox',
				\ '\.idea',
				\ '\.pyc',
				\ '\.png',
				\ '\.gif',
				\ '\.jpg',
				\ '\.svg',
				\ '\.eot',
				\ '\.ttf',
				\ '\.woff',
				\ '\.ico',
				\ '\.o',
				\ '__pycache__',
				\ '.env',
				\ '.env*',
				\ '.vagrant',
				\ '_build',
				\ 'dist',
				\ '*.tar.gz',
				\ '*.zip',
				\ 'node_modules',
				\ 'bower_components',
				\ '.*\.egg',
				\ '*.egg-info',
				\ '.*egg-info.*',
				\ 'git5/.*/review/',
				\ 'google/obj/',
				\ '\.webassets-cache/',
				\ '\.sass-cache/',
				\ '\.coverage/',
				\ '\.m2/',
				\ '\.activator/',
				\ '\.composer/',
				\ '\.cache/',
				\ '\.npm/',
				\ '\.node-gyp/',
				\ '\.sbt/',
				\ '\.ivy2/',
				\ '\.local/activator/',
				\ ], '\|'))
catch
endtry
