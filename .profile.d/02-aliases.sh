source $HOME/.functions/sysinfo/platform.lib

os_x_aliases() {
    alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    alias wifi="/usr/sbin/system_profiler SPAirPortDataType"
    alias serial="/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number'"

    # http://ianlunn.co.uk/articles/quickly-showhide-hidden-files-mac-os-x-mavericks/
    # http://computers.tutsplus.com/tutorials/speed-up-your-terminal-workflow-with-command-aliases-and-profile--mac-30515
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

    # app shortcuts
    firefox() { open -a 'Firefox' "http://${@}"; }
    chrome() { open -a 'Google Chrome' "http://${@}"; }
    trash () { command mv "$@" ~/.Trash ; } 
    ql () { qlmanage -p "$*" >& /dev/null; }
}

linux_aliases() {
    # TODO
    echo ""
}

global_aliases() {
    # note: currently assuming os x is using gnu coreutils for ls
    alias ls='ls --color'
    alias ll='ls -l'
    alias la='ls -A'
    alias lla='ls -lA'
    alias l='ls -CF'
    alias g='git'
    alias cget='curl -C - -O'
    alias less='less -R'
    alias tmux='tmux -2'
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }
}

case "${SYS_PLATFORM}" in
    darwin)
        global_aliases
        os_x_aliases
        ;;
    inux)
        global_aliases
        linux_aliases
        ;;
    *)
        global_aliases
        ;;
esac


