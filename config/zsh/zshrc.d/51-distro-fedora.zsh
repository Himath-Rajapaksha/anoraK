# 51-distro-fedora.zsh — Fedora / RHEL / Rocky / Alma / CentOS Stream
[[ -r /etc/os-release ]] || return 0
. /etc/os-release
case "${ID:-}" in fedora|rhel|rocky|almalinux|centos|ol) ;; *) return 0 ;; esac

alias update='sudo dnf makecache'
alias upgrade='sudo dnf upgrade -y'
alias full-upgrade='sudo dnf distro-sync -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf remove -y'
alias purge='sudo dnf remove -y'
alias autoremove='sudo dnf autoremove -y'
alias autoclean='sudo dnf clean all'
alias aptclean='sudo dnf clean all'
alias search='dnf search'
alias pkgs='rpm -qa'
alias info='dnf info'
alias depends='dnf repoquery --requires'
alias held='dnf versionlock list'
alias policy='dnf list --showduplicates'
alias firewall='sudo firewall-cmd --list-all'
alias selinux='getenforce'
alias trim='sudo fstrim -v /'

# SELinux denials, most recent last
alias sealert='sudo ausearch -m AVC -ts recent'
