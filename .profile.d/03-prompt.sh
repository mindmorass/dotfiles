source $HOME/.functions/profile.lib
source $HOME/.functions/shell.lib
source $HOME/.functions/colors.lib

_colors_initialize_ansi "ps1"

profile_d=$(_profile_d)
scripts_dir="${profile_d}/scripts"

source $scripts_dir/git/git-prompt.sh

set_prompt() {
    local shell=$(which_shell)

    case "${shell}" in
        bash)
            # git completion sourced from 
            # https://github.com/git/git/tree/master/contrib/completion
            # consider git archive or curling the RAW file in the plugin modules
            source $scripts_dir/git/git-completion.bash

            # http://wiki.bash-hackers.org/snipplets/print_horizontal_line
            # PROMPT_COMMAND="echo $'\e7\e[2;800H\e[16D\e[7m' $(date +"%Y/%m/%d %H:%M")$'\e8'"
            PROMPT_COMMAND="echo -e '${blackf}${boldon}'; eval printf '%.0s_' '{1.."${COLUMNS:-$(tput cols)}"}'; echo -e '${reset}'"
            PS1="${ps_yellowf}${ps_boldoff}(${ps_cyanf}\u${ps_whitef}${ps_boldoff}@${ps_cyanf}\h${ps_redf}${ps_boldon} \W\$(__git_ps1 ' ${ps_greenf}[${ps_purplef}%s${ps_greenf}]${ps_reset}')${ps_reset}${ps_yellowf})${ps_reset}\n${ps_blackf}${ps_boldon}|${ps_whitef}${ps_boldoff}[${ps_whitef}${ps_boldon} \d - \T ${ps_whitef}${ps_boldoff}]${ps_blackf}${ps_boldon}|${ps_reset}\n ${ps_redf}${ps_boldon}\\_${ps_yellowf}${ps_boldoff} \$${ps_reset} "
            ;;
        zsh)
            setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
            ;;
    esac
}

set_prompt
