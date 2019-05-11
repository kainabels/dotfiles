" Key Mappings

" ,のデフォルトの機能は、\で使えるように退避
noremap \ ,

" C-@: 挿入モードから抜ける
imap <C-@> <C-[>
" C-j: 挿入モードから抜ける
imap <C-j> <C-[>
" ZQ: 保存せず終了は安全のため、外す
nnoremap ZQ <Nop>
" カーソル移動は見た目行で
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
"削除でヤンクしない
nnoremap x "_x

" plugin用プレースホルダ
" operator
noremap [op] <Nop>
map s [op]

" クリップボードからペースト
vnoremap <silent> <C-p> "0p<CR>
" paste-modeきりかえ
nnoremap <silent> <F10> :call Paste_on_off()<CR>
set pastetoggle=<F10>
" Paste Mode 切り替え {{{
let g:paste_mode = 0 " 0 = normal, 1 = paste
 
function! Paste_on_off()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif
    return
endfunc
"}}}

" for git mergetool
if &diff
  map <Leader>1 :diffget LOCAL<CR>
  map <Leader>2 :diffget BASE<CR>
  map <Leader>3 :diffget REMOTE<CR>
  map <Leader>u :<C-u>diffupdate<CR>
  map u u:<C-u>diffupdate<CR>
endif
