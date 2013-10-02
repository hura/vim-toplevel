" vim: et sw=2 sts=2

scriptencoding utf-8

if exists('g:loaded_toplevel') || &cp
  finish
endif
let g:loaded_toplevel = 1

command! -nargs=0 -bar -bang Root call toplevel#find_root_by_system(<bang>0)
command! -nargs=0 -bar -bang Cd   call toplevel#find_root_by_finddir(<bang>0)

if get(g:, 'toplevel_change_on_bufenter')
  augroup toplevel
    autocmd BufEnter * silent Cd
  augroup END
endif
