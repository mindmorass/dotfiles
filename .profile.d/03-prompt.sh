#https://github.com/git/git/tree/master/contrib/completion

source $HOME/.functions/profile.lib
source $HOME/.functions/shell.lib
source $HOME/.functions/colors.lib

profile_d=$(_profile_d)
scripts_dir="${profile_d}/scripts"

source $scripts_dir/git/git-prompt.sh

shell=$(which_shell)
case $shell in
    bash)
        source $scripts_dir/git/git-completion.bash
        PS1='$(echo -e ${yellowf}\(${cyanf}\u${whitef}${boldoff}@${cyanf}\h${reset}) $(echo -e ${redf}${boldon}\W${reset})$(__git_ps1 " ${greenf}[${purplef}%s${greenf}]${reset}")$(echo -e ${yellowf}\)${whitef}\$${reset}) '
        ;;
    zsh)
        source $scripts_dir/git/git-completion.zsh
        setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '
        ;;
esac
