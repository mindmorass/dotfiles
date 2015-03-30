# a quick and dirty profile management plugin 
# concepts similar to vundle to get projects from github
# but for general profile use

# do not use indrect expansion or zsh breaks ${!VAR}
# http://tldp.org/LDP/abs/html/ivr.html
# using a lot of eval here... I don't like that ..
# need to learn more about the diffieren expansions for each shell 

source $HOME/.functions/colors.lib
source $HOME/.functions/profile.lib
source $HOME/.functions/yaml.lib
source $HOME/.functions/sysinfo/platform.lib

#set -x

_retrieve_plugin() {
    local plugin_source="${1}"
    profile_plug "${plugin_source}"
}

_target() {
    local plugin="${1}"
    local plugin_target="${plugin}_target"
    echo $(eval echo "\$${plugin_target}")
}

_execute() {
    local plugin="${1}"
    local plugin_execute="${plugin}_execute"
    echo $(eval echo "\$${plugin_execute}")
}

_source() {
    local plugin="${1}"
    local plugin_source="${plugin}_source"
    echo $(eval echo "\$${plugin_source}")
}

_link_target() {
    local plugin="${1}"
    local plugin_link_target="${plugin}_link_target"
    echo $(eval echo "\$${plugin_link_target}")
}

_link_source() {
    local plugin="${1}"
    local plugin_link_source="${plugin}_link_source"
    echo $(eval echo "\$${plugin_link_source}")
}

_plugin_notice() {
    local plugin="${1}"
    colors_green_notice "installing plugin ${plugin}"
}

_execute_plugin() {
    local plugin="${1}"
    local plugin_source="${2}"
    local command="${3}"
    local plugin_target="${4}"
    local plugin_dir=$(_plugin_dir)

    if test -n "${command}"; then
        if test $(which $command); then
            full_cmd="${command} ${plugin_dir}/${plugin_source}/${plugin_target}"
            eval `$full_cmd`
        else
            colors_yellow_notice "dependency not met"
        fi
    fi
}

_create_links() {
    local plugin="${1}"
    local plugin_source="${2}"
    local link_source="${3}"
    local link_target="${4}"
    local plugin_dir=$(_plugin_dir)

    if [[ -n "${link_source}" && -n "${link_target}" ]]; then
        if ! test -h ${link_target}; then
            _plugin_notice "${plugin}"
            colors_yellow_notice "Creating Symlink for ${link_target}"
            local link_command="ln -sf ${plugin_dir}/${plugin_source}/${link_source}  ${link_target}"
            eval $($link_command)
        fi
    fi
}

install_plugins() {
    local plugins_dir=$(_plugin_dir)
    local plugins=$(grep "^[[:alpha:]]" $HOME/.profile.d/plugins.yml | cut -d : -f 1)

    for plugin in $plugins; do
        # http://mywiki.wooledge.org/BashFAQ/048
        eval $(yaml_parse $HOME/.profile.d/plugins.yml)

        local source=$(_source "${plugin}")
        local target=$(_target "${plugin}")
        local execute=$(_execute "${plugin}")
        local link_source=$(_link_source "${plugin}")
        local link_target=$(_link_target "${plugin}")

        # clone plugins and run commands or create links as needed
        _retrieve_plugin "${source}"
        _execute_plugin "${plugin}" "${source}" "${execute}" "${target}"
        _create_links "${plugin}" "${source}" "${link_source}" "${link_target}"
    done
}

install_plugins
