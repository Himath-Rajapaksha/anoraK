# 50-distro-debian.zsh — Debian / Ubuntu / Mint / Pop / Kali
[[ -r /etc/os-release ]] || return 0
( . /etc/os-release; case "${ID:-}" in debian|ubuntu|linuxmint|pop|kali|raspbian|neon|elementary|zorin) ;; *) exit 1 ;; esac ) || return 0

alias update='sudo apt update'
alias upgrade='sudo apt upgrade -y'
alias install='sudo apt install -y'
alias remove='sudo apt remove -y'
alias autoremove='sudo apt autoremove -y'
alias autoclean='sudo apt autoclean'
alias clean='sudo apt clean'
alias search='apt search'
alias list='dpkg -l | grep'
alias info='apt-cache show'
alias depends='apt-cache depends'
alias held='dpkg --get-selections | grep hold'
alias firewall='sudo iptables -L -n'

# Kill stuck apt/dpkg locks, same steps as the original one-liner.
aptfix() {
  sudo killall -9 apt apt-get dpkg 2>/dev/null
  sudo rm -f /var/lib/dpkg/lock-frontend /var/lib/dpkg/lock \
             /var/cache/apt/archives/lock /var/lib/apt/lists/lock
  sudo dpkg --configure -a
  echo "apt locks cleared"
}

# Trim SSD (no-op on spinning disks)
alias trim='sudo fstrim -v /'
