vim-toplevel
------------

by Marco Hinz

Twitter: https://twitter.com/_mhinz_  
IRC: __mhi^__ (Freenode)

If you use any of my plugins, please star them on github. It's a great way of
getting feedback and gives me the kick to put more time into their development.
If you encounter any bugs or have feature requests, just open an issue report on
Github.

Intro
-----

vim-toplevel helps changing to the root directory of a version control system.

Supported VCS:

    - git
    - hg
    - bzr

If you want support for another VCS, please open an issue report on Github (or
send a pull request). Thanks!

---

There are really just two commands that try to accomplish the same: changing to
the root directory. Both use different approaches, though.

You'll almost always want to use `:Cd`, because it should be faster since it
doesn't have to run external programs.

---

```
:Cd        change directory for the current window
:Cd!       change directory for all windows
```

This command uses the builtin function _finddir()_ to get the VCS root
repository and change to it. It starts searching upwards from the directory of
the current buffer.

```
:Root      change directory for the current window
:Root!     change directory for all windows
```

This command uses the builtin function _system()_ to start external programs
(e.g. _git_ or _hg_) to get the VCS root directory and change to it.

Options
-------

Put these variables into your vimrc:

    let g:toplevel_vcs_list = ['git', 'hg']

Tell vim-toplevel what VCS to look for and in what order.

Possible values are: `['git', 'hg', 'bzr']`

    let g:toplevel_enable_vimshell = 0

If you're on Windows and have vim-misc/vim-shell installed, enabling this will
avoid the annoying flickering of the cmd.exe popping up for the fraction of a
second. Only makes a difference for `:Root`, not for `:Cd`.

Installation & Documentation
----------------------------

If you have no preferred installation method, I suggest using tpope's
[pathogen](https://github.com/tpope/vim-pathogen). Afterwards installing
vim-toplevel is as easy as pie:

    $ git clone https://github.com/mhinz/vim-toplevel ~/.vim/bundle/vim-toplevel

It works without any configuration, but you might want to look into the
documentation for further customization:

    :Helptags  " rebuilding tags files
    :h toplevel

License
-------

MIT license. Copyright (c) 2013 Marco Hinz.
