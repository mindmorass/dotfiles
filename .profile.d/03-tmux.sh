source $HOME/.functions/profile.lib
source $HOME/.functions/sysinfo/platform.lib

prepare_tmux() {
    local plugin_dir=$(_plugin_dir)
    local my_plugin=$(profile_plug "altercation/solarized")

    if test -f "${plugin_dir}/${my_plugin}/tmux/tmuxcolors-dark.conf"; then
        if test ! -h "${HOME}/.tmux.conf"; then
            ln -sf "${plugin_dir}/${my_plugin}/tmux/tmuxcolors-dark.conf" "${HOME}/.tmux.conf" 
        fi
    fi
}

prepare_tmux
