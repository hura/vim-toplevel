" vim: et sw=2 sts=2

scriptencoding utf-8

" Init {{{1
let s:vcs_dict = {
      \ 'git': 'git',
      \ 'hg':  'hg',
      \ }

let s:vcs_list = get(g:, 'cd_vcs_list', [])
if empty(s:vcs_list)
  let s:vcs_list = keys(filter(s:vcs_dict, 'executable(v:val)'))
endif

let s:vsmode = (has('win32') && get(g:, 'cd_enable_vimshell')) ? 1 : 0
"}}}

" #find_root_by_finddir {{{1
function! cd#find_root_by_finddir(bang) abort
  if exists('b:root_by_finddir')
    return cd#cd_to_vcs_root(a:bang, b:root_by_finddir)
  endif

  let curdir = resolve(expand('%:p:h'))

  for vcs in s:vcs_list
    let root = finddir('.'.vcs, curdir.';')
    if !empty(root)
      let b:root_by_finddir = fnamemodify(root, ':p:h:h')
      return cd#cd_to_vcs_root(a:bang, b:root_by_finddir)
    endif
  endfor

  echohl ErrorMsg
  echo 'No VCS found.'
  echohl NONE
endfunction

" #find_root_by_system {{{1
function! cd#find_root_by_system(bang) abort
  if exists('b:root_by_system')
    return cd#cd_to_vcs_root(a:bang, b:root_by_system)
  endif

  for vcs in s:vcs_list
    try
      let root = cd#detect_{vcs}()
    catch
      continue
    endtry

    if !empty(root)
      let b:root_by_system = split(root)[0]
      return cd#cd_to_vcs_root(a:bang, b:root_by_system)
    endif
  endfor

  echohl ErrorMsg
  echo 'No VCS found.'
  echohl NONE
endfunction
"}}}

" #cd_to_vcs_root {{{1
function! cd#cd_to_vcs_root(bang, root) abort
  if a:bang
    execute 'cd' a:root
  else
    execute 'lcd' a:root
  endif
  echo 'Changed to: '. a:root
endfunction
"}}}

" #detect_git {{{1
function! cd#detect_git() abort
  let cmd = 'git rev-parse --show-toplevel'

  if s:vsmode
    let ret = xolox#misc#os#exec({'command': cmd})
    return ret.exit_code ? '' : join(ret.stdout, "\n")
  endif

  let root = system(cmd)
  return v:shell_error ? '' : root
endfunction

" #detect_hg {{{1
function! cd#detect_hg() abort
  let cmd = 'hg root'

  if s:vsmode
    let ret = xolox#misc#os#exec({'command': cmd})
    return ret.exit_code ? '' : join(ret.stdout, "\n")
  endif

  let root = system(cmd)
  return v:shell_error ? '' : root
endfunction
