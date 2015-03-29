#https://github.com/git/git/tree/master/contrib/completion

source $HOME/.functions/profile.lib
source $HOME/.functions/shell.lib
source $HOME/.functions/colors.lib

_colors_initialize_ansi "ps1"

profile_d=$(_profile_d)
scripts_dir="${profile_d}/scripts"

source $scripts_dir/git/git-prompt.sh

shell=$(which_shell)
case $shell in
    bash)
        # git completion sourced from 
        # https://github.com/git/git/tree/master/contrib/completion
        # consider git archive in the plugin modules
        source $scripts_dir/git/git-completion.bash
        # drop a newline between prompts
        PROMPT_COMMAND="echo"
        PS1="${yellowf}${boldoff}(${cyanf}\u${whitef}${boldoff}@${cyanf}\h${redf}${boldon} \W\$(__git_ps1 ' ${greenf}[${purplef}%s${greenf}]${reset}')${reset}${yellowf})${reset}\n${blackf}${boldon}|${whitef}${boldoff}[${whitef}${boldon} \d - \T ${whitef}${boldoff}]${blackf}${boldon}|${reset}\n ${redf}${boldon}\\_${yellowf}${boldoff} \$${reset} "
        ;;
    zsh)
        source $scripts_dir/git/git-completion.zsh
        setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
        ;;
esac

# hack ... 
# be nice and set colors back to normal for scripts
# should find a way to make the color scheming more generic
# test something like this
# https://linuxtidbits.wordpress.com/2008/08/11/output-color-on-bash-scripts/

_colors_initialize_ansi
