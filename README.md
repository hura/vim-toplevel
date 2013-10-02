vim-cd
------

by Marco Hinz

Twitter: https://twitter.com/_mhinz_  
IRC: __mhi^__ (Freenode)

If you use any of my plugins, please star them on github. It's a great way of
getting feedback and gives me the kick to put more time into their development.
If you encounter any bugs or have feature requests, just open an issue report on
Github.

Intro
-----

vim-cd helps changing to the root directory of a version control system.

Supported VCS:

    - git
    - hg

If you want support for another VCS, please open an issue report on Github (or
send a pull request). Thanks!

---

There are really just two commands:

```
:Cd        change directory for the current window
:Cd!       change directory for all windows
```

This command uses the builtin function _finddir()_ to get the VCS root repository
and change to it. It starts searching from the directory of the current
buffer.

```
:Root      change directory for the current window
:Root!     change directory for all windows
```

This command uses the builtin function |system()| to start external programs
(e.g. _git_ or _hg_) to get the VCS root directory and change to it.

Options
-------

Put these variables into your vimrc:

    let g:cd_vcs_list = ['git', 'hg']

Tell vim-cd what VCS to look for and in what order.

Installation & Documentation
----------------------------

If you have no preferred installation method, I suggest using tpope's
[pathogen](https://github.com/tpope/vim-pathogen). Afterwards installing
vim-cd is as easy as pie:

    $ git clone https://github.com/mhinz/vim-cd ~/.vim/bundle/vim-cd

It works without any configuration, but you might want to look into the
documentation for further customization:

    :Helptags  " rebuilding tags files
    :h vim-cd

License
-------

MIT license. Copyright (c) 2013 Marco Hinz.
