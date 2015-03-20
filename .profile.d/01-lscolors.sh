source $HOME/.functions/profile.lib
source $HOME/.functions/sysinfo/platform.lib

profile_aliases() {
    local plugin_dir=$(_plugin_dir)
    local my_plugin=$(profile_plug "sigurdga/ls-colors-solarized")

    if test -e $(which dircolors); then
        eval $(dircolors -b ${plugin_dir}/${my_plugin}/dircolors)
    fi
    
    if [ "${SYS_PLATFORM}" == "darwin" ]; then
        export CLICOLOR=1
    fi
}

profile_aliases
