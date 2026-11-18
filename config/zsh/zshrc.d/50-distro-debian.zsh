# 50-distro-debian.zsh — Debian / Ubuntu / Mint / Pop / Kali
[[ -r /etc/os-release ]] || return 0
. /etc/os-release
case "${ID:-}" in debian|ubuntu|linuxmint|pop|kali|raspbian|neon|elementary|zorin) ;; *) return 0 ;; esac

alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'
alias full-upgrade='sudo apt full-upgrade -y'
alias install='sudo apt install -y'
alias remove='sudo apt remove -y'
alias purge='sudo apt purge -y'
alias autoremove='sudo apt autoremove -y'
alias autoclean='sudo apt autoclean'
alias aptclean='sudo apt clean'
alias search='apt search'
alias pkgs='dpkg -l'
alias info='apt-cache show'
alias depends='apt-cache depends'
alias held='apt-mark showhold'
alias policy='apt-cache policy'
alias firewall='sudo iptables -L -n'

# Recover from a wedged apt/dpkg lock. Safe: only kills lock holders.
aptfix() {
  sudo rm -f /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock \
             /var/cache/apt/archives/lock /var/lib/apt/lists/lock
  sudo dpkg --configure -a && echo "apt locks cleared"
}

# Trim SSD (no-op on spinning disks)
alias trim='sudo fstrim -v /'
