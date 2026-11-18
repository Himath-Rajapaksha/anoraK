# 54-linux-system.zsh — systemd and Linux-only helpers. Skipped on macOS.
[[ "$(uname -s)" == Linux ]] || return 0

if command -v systemctl >/dev/null 2>&1; then
  alias services='systemctl list-units --type=service --state=running'
  alias failed='systemctl --failed'
  alias status='systemctl status'
  alias start='sudo systemctl start'
  alias stop='sudo systemctl stop'
  alias restart='sudo systemctl restart'
  alias enable='sudo systemctl enable'
  alias disable='sudo systemctl disable'
  alias journal='journalctl -u'
  alias jfollow='journalctl -f -u'
  alias jerrors='journalctl -p err -b --no-pager'
  alias units='systemctl list-unit-files --state=enabled'
  alias boottime='systemd-analyze blame'
  alias reboot='sudo systemctl reboot'
  alias poweroff='sudo systemctl poweroff'
  alias suspend='sudo systemctl suspend'
  alias hibernate='sudo systemctl hibernate'
fi

command -v dmesg >/dev/null 2>&1 && alias dmesg='dmesg | tail -50'
command -v ps >/dev/null 2>&1 && alias topcpu='ps aux --sort=-%cpu | head -10'
command -v ps >/dev/null 2>&1 && alias topmem='ps aux --sort=-%mem | head -10'
alias kill9='kill -9'
alias psg='ps aux | grep'

# Kernel module toggle for VirtualBox/KVM coexistence.
# Only defined if the module actually exists on this kernel.
if [[ -d /sys/module/kvm_intel ]]; then
  alias kvm-on='sudo modprobe kvm_intel && echo "KVM ON"'
  alias kvm-off='sudo modprobe -r kvm_intel kvm && echo "KVM OFF"'
elif [[ -d /sys/module/kvm_amd ]]; then
  alias kvm-on='sudo modprobe kvm_amd && echo "KVM ON"'
  alias kvm-off='sudo modprobe -r kvm_amd kvm && echo "KVM OFF"'
fi
