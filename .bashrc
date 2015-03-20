# I prefer source over '.' for readability
# TODO: pull most of the includes into bashrc.d files
# storing libraries in $HOME/.functions

source $HOME/.functions/path.lib
source $HOME/.functions/jenv.lib
source $HOME/.functions/profile.lib

# RVM
# https://rvm.io/
if [ -d "${HOME}/.rvm" ]; then
    [[ -s "${HOME}/.rvm/scripts/rvm" ]] && source "${HOME}/.rvm/scripts/rvm"
    [[ -d "${HOME}/.rvm/bin" ]] && export PATH="${PATH}:${HOME}/.rvm/bin"
fi

# Perlbrew
# http://perlbrew.pl/
if [ -d "${HOME}/perl5" ]; then
    [[ -s "${HOME}/perl5/perlbrew/etc/bashrc" ]] && source "${HOME}/perl5/perlbrew/etc/bashrc"
    PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
    PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;
fi

# PATH
pre_path /opt/chefdk/bin
pre_path /usr/local/opt/coreutils/libexec/gnubin
pre_path $HOME/bin
add_path /usr/sbin
add_path /sbin
add_path $HOME/.jenv/bin

eval "$(jenv init -)"
setjdk 1.8

profile_init
