let s:is_windows = has('win32') || has('win64')

function! IsWindows() abort
  return s:is_windows
endfunction

function! IsMac() abort
  return !s:is_windows && !has('win32unix')
      \ && (has('mac') || has('macunix') || has('gui_macvim')
      \     || (!executable('xdg-open') && system('uname') =~? '^darwin'))
endfunction

" Plugin用
let mapleader = ","
let g:maplocalleader = "m"

" 文字をレジスタに入れて挿入を開始(clと同じ)を潰す
nnoremap s <Nop>
" 入力した文字の左側までジャンプを潰す
nnoremap t <Nop>
" マーカーを潰す
"noremap m <Nop>
"xnoremap m <Nop>
" f,t,F,Tジャンプ後に逆方向に繰り返すを潰す
nnoremap ,  <Nop>
xnoremap ,  <Nop>

if IsWindows()
  " Exchange path separator.
   set shellslash
endif
