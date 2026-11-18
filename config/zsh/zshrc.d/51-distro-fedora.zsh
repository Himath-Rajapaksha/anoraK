# 51-distro-fedora.zsh — Fedora / RHEL / Rocky / Alma / CentOS Stream
[[ -r /etc/os-release ]] || return 0
( . /etc/os-release; case "${ID:-}" in fedora|rhel|rocky|almalinux|centos|ol) ;; *) exit 1 ;; esac ) || return 0

alias update='sudo dnf makecache'
alias upgrade='sudo dnf upgrade -y'
alias install='sudo dnf install -y'
alias remove='sudo dnf remove -y'
alias autoremove='sudo dnf autoremove -y'
alias autoclean='sudo dnf clean all'
alias clean='sudo dnf clean all'
alias search='dnf search'
alias list='rpm -qa | grep'
alias info='dnf info'
alias depends='dnf repoquery --requires'
alias held='dnf versionlock list'
alias firewall='sudo firewall-cmd --list-all'
alias trim='sudo fstrim -v /'
