source $HOME/.functions/sysinfo/platform.lib

os_x_aliases() {
    alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    alias wifi="/usr/sbin/system_profiler SPAirPortDataType"
    alias serial="/usr/sbin/system_profiler SPHardwareDataType | grep 'Serial Number'"
}

linux_aliases() {
    # TODO
    echo ""
}

global_aliases() {
    alias ll='ls -l'
    alias la='ls -A'
    alias lla='ls -lA'
    alias l='ls -CF'
    alias g='git'
    alias cget='curl -C - -O'
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


