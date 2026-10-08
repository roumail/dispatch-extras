" dispatch-extras: small helpers on top of tpope/vim-dispatch. No keys are
" bound here; pytest or your vimrc map the <Plug>s.
if exists('g:loaded_dispatch_extras')
  finish
endif
let g:loaded_dispatch_extras = 1

" Required plugins are checked once every plugin has loaded (VimEnter, or now
" when loaded later): their g:loaded_* guards tell whether they are installed.
" Without them nothing below is defined.
function! s:init() abort
  let l:missing = filter({
        \ 'tpope/vim-dispatch': 'g:loaded_dispatch',
        \ }, '!exists(v:val)')
  if !empty(l:missing)
    echohl WarningMsg
    echomsg 'dispatch-extras: not loaded, requires ' . join(sort(keys(l:missing)), ', ')
    echohl None
    return
  endif

  " Open log of last dispatch run as a buffer
  nnoremap <Plug>(dispatch-extras-log) :tabedit `=dispatch#request().file`<CR>
  " Switch b/w tmux and terminal running strategy for Start (used for debugging)
  nnoremap <Plug>(dispatch-extras-toggle-start-strategy) <Cmd>call dispatch_extras#toggle_start_strategy()<CR>
  " rerun last start command (debug)
  nnoremap <Plug>(dispatch-extras-repeat-start) <Cmd>call dispatch_extras#repeat_last_start()<CR>
  " rerun last dispatch command (run)
  " https://github.com/tpope/vim-dispatch/issues/80#issuecomment-290958499
  nnoremap <Plug>(dispatch-extras-repeat-dispatch) :Copen \| Dispatch<CR>
endfunction

if v:vim_did_enter
  call s:init()
else
  augroup dispatch_extras_init
    autocmd!
    autocmd VimEnter * ++once call s:init()
  augroup END
endif
