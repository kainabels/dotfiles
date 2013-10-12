set nocompatible
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'

NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimfiler'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'The-NERD-Commenter'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'sudo.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'ctrlp.vim'

NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'mattn/zencoding-vim'

" Installation check.
NeoBundleCheck

filetype plugin indent on

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.scss = '^\s\+\w\+\|\w\+[):;]\?\s\+\|[@!]'

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS

" NERDCommenter
" コメントした後に挿入するスペースの数
let NERDSpaceDelims = 1
" キーマップの変更。<Leader>=\+cでコメント化と解除を行う。
" コメントされていれば、コメントを外し、コメントされてなければコメント化する。
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" matchit
source $VIMRUNTIME/macros/matchit.vim

" * visual setting
set number
set title
set ruler
set showcmd
set wildmenu
set wildmode=list:full
set wildchar=<tab>
set matchtime=2
set cursorline
syntax on
set shortmess+=|
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=
set laststatus=2

" * key setting
imap <C-@> <C-[>

" * indent setting
set ai
set si
set ci
"set noexpandtab
set ts=2
set sw=2
set softtabstop=2

" * search setting
set incsearch
set smartcase
set wrapscan
set ignorecase

" * edit setting
set backspace=indent,eol,start
set fileformats=unix,dos,mac
set vb t_vb=
set nobackup
set writebackup
set hidden
set formatoptions=c,q,r,t
"set foldmethod=syntax

set nrformats-=octal
set clipboard=unnamed

" file encoding
set encoding=utf8
set termencoding=utf8
set fileencoding=utf8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8
"set paste

" change current-directory on enter buffer.
"au BufEnter * execute ":lcd " . expand("%:p:h")
"
" Python settings.
au BufEnter *.py setlocal indentkeys+=0#
au BufEnter *.py setlocal expandtab
au BufEnter *.py setlocal nosmartindent
au BufEnter *.rb setlocal indentkeys+=0#


" 入力モードの時にステータスラインの色を変える。
let g:hi_insert = 'highlight StatusLine guifg=LightGrey guibg=darkblue gui=none ctermfg=white ctermbg=blue cterm=none'

if has('syntax')
augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

