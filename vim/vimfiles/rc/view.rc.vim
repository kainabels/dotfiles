" View Settings

" 行番号表示
set number
" タイトルをウィンドウ枠に表示
set title
" ルーラーを表示
set ruler
" 入力中のコマンドをステータスバーに表示
set showcmd
" ステータスバーを常に表示
set laststatus=2
" ステータスバーの表示内容
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=

set wildmenu
set wildmode=list:longest,full
set wildchar=<tab>
" 履歴の個数
set history=1000
" 対応する括弧の表示時間
set matchtime=2
" カーソル行のライン表示
set cursorline
"
set shortmess+=|
"
set scrolloff=10

" モードラインを解釈する
set modeline

