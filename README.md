# dispatch-extras

Small helpers on top of [vim-dispatch](https://github.com/tpope/vim-dispatch).
Binds no keys itself; it provides `<Plug>` mappings for your vimrc or other plugins
(such as [pytest.vim](https://github.com/roumail/pytest.vim)).

| Mapping | Action |
| --- | --- |
| `<Plug>(dispatch-extras-repeat-start)` | Repeat the last `:Start` |
| `<Plug>(dispatch-extras-repeat-dispatch)` | `:Copen` and repeat the last `:Dispatch` |
| `<Plug>(dispatch-extras-toggle-start-strategy)` | Toggle `:Start` between terminal and tmux |
| `<Plug>(dispatch-extras-log)` | Open the log of the last dispatch run |

## Install

Requires [vim-dispatch](https://github.com/tpope/vim-dispatch).
With [vim-requires](https://github.com/roumail/vim-requires), Vim shows
`dispatch-extras: requires …` at startup when one isn't loaded.

```vim
Plug 'tpope/vim-dispatch'
Plug 'roumail/vim-requires'  " optional: the startup warning
Plug 'roumail/dispatch-extras'
```
