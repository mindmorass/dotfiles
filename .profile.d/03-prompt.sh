source $HOME/.functions/profile.lib
source $HOME/.functions/shell.lib
source $HOME/.functions/colors.lib

_colors_initialize_ansi "ps1"

profile_d=$(_profile_d)
scripts_dir="${profile_d}/scripts"

source $scripts_dir/git/git-prompt.sh

set_prompt() {
    local shell=$(which_shell)

    case $shell in
        bash)
            # git completion sourced from 
            # https://github.com/git/git/tree/master/contrib/completion
            # consider git archive in the plugin modules
            source $scripts_dir/git/git-completion.bash
            # drop a newline between prompts
            PROMPT_COMMAND="echo"
            PS1="${ps_yellowf}${ps_boldoff}(${ps_cyanf}\u${ps_whitef}${ps_boldoff}@${ps_cyanf}\h${ps_redf}${ps_boldon} \W\$(__git_ps1 ' ${ps_greenf}[${ps_purplef}%s${ps_greenf}]${ps_reset}')${ps_reset}${ps_yellowf})${ps_reset}\n${ps_blackf}${ps_boldon}|${ps_whitef}${ps_boldoff}[${ps_whitef}${ps_boldon} \d - \T ${ps_whitef}${ps_boldoff}]${ps_blackf}${ps_boldon}|${ps_reset}\n ${ps_redf}${ps_boldon}\\_${ps_yellowf}${ps_boldoff} \$${ps_reset} "
            ;;
        zsh)
            source $scripts_dir/git/git-completion.zsh
            setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
            ;;
    esac
}

set_prompt
