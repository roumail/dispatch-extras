" dispatch-extras: small helpers on top of tpope/vim-dispatch. No keys are
" bound here; pytest or your vimrc map the <Plug>s.
if exists('g:loaded_dispatch_extras')
  finish
endif
let g:loaded_dispatch_extras = 1

" Warns at startup when a required plugin isn't loaded (roumail/vim-requires)
try
  call roumail_requires#check('dispatch-extras', {
        \ 'tpope/vim-dispatch': 'g:loaded_dispatch',
        \ })
catch /^Vim\%((\a\+)\)\=:E117:/
endtry

nnoremap <Plug>(dispatch-extras-log) :tabedit `=dispatch#request().file`<CR>
nnoremap <Plug>(dispatch-extras-toggle-start-strategy) <Cmd>call dispatch_extras#toggle_start_strategy()<CR>
nnoremap <Plug>(dispatch-extras-repeat-start) <Cmd>call dispatch_extras#repeat_last_start()<CR>
" https://github.com/tpope/vim-dispatch/issues/80#issuecomment-290958499
nnoremap <Plug>(dispatch-extras-repeat-dispatch) :Copen \| Dispatch<CR>
