" Edit settings

" Search settings {{{ 
set incsearch
set nohlsearch
set smartcase
set wrapscan
" }}}

" * edit setting
set backspace=indent,eol,start
set fileformats=unix,dos,mac

" ビープは鳴らさない
set vb t_vb=
" undo
set undodir=~/.vimundo
" バックアップは作らない
set nobackup
" 
set writebackup
" 編集中でも他のファイルを開けるように
set hidden
" 
set formatoptions=c,q,r,t

" folding
set foldmethod=marker

" clipboard
set nrformats-=octal
set clipboard=unnamed

" file encoding
set encoding=utf8
set termencoding=utf8
"set fileencoding=utf8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8

" change current-directory on enter buffer.
"au BufEnter * execute ":lcd " . expand("%:p:h")
"

" Indent setting {{{
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=0
" タブ時にスペースをつかう
set expandtab
" インデントをshiftwidthに丸める
set shiftround
"}}}

" vimdiff settings {{{
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7


