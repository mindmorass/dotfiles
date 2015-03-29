Plugin Management
====
- drop any simple script file here that you want automatically loaded that ends with the .sh extension to automatically run on login (try to be be bash and zsh friendly)
- plugins.yml uses local functions and tries to automatically download plugins (github content)
- username/repo [orgname/repo] with some keyworks in a yaml file - helps minimize scripts

# plugins.yml
keywords
- in theory each keyword can be used as a variable - pretty sure this breaks yaml rules
but I consider profile management more declarative so I'm willing to crack a few eggs
- all keywords should be under a random name (something that describes what the plugin is) examples should be self explanitory.

## Supports
    Primarily uses bash.  Future ZSH and Fish support

Variables
----

#### source
    github <user>/<reponame> which the plugin modules will translate to https://github.com/<user>/<reponame>.git
    example:
        source: altercation/solarized

#### execute
    program depenency (performs a which to check for command in your PATH)
    example:
        execute: curl

#### target
    target files to run agains execute (relative to the root of the source directory structure)
    example:
        target: dircolor

#### link_source
    symlink filename

#### link_target
    symlink target value

Examples
----
    ```bash
    ls_colors:
      source: altercation/solarized
      execute: dircolors
      execute: dircolors

    tmux:
      source: sigurdga/ls-colors-solarized
      link_source: ${plugins_dir}/${source}/tmux/tmuxcolors-dark.conf
      link_target: ${HOME}/.tmux.conf
    ```

TODO:
- break profile management out into it's own repo?
- generic shell support http://hyperpolyglot.org/unix-shells
- git archive support to pull individual files from github repos: nice when repo is large or curl the raw files
