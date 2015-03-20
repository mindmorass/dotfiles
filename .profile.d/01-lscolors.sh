source $HOME/.functions/profile.lib
source $HOME/.functions/sysinfo/platform.lib

profile_aliases() {
    local plugin_dir=$(_plugin_dir)

    profile_plug "sigurdga/ls-colors-solarized"

    if which dircolors; then
        eval $(dircolors -b ${plugin_dir}/dircolors)
    fi
    
    if [ "${SYS_PLATFORM}" == "darwin" ]; then
        export CLICOLOR=1
    fi
}
