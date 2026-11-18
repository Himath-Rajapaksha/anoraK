# 54-linux-system.zsh — systemd and Linux-only helpers. Skipped on macOS.
[[ "$(uname -s)" == Linux ]] || return 0

if command -v systemctl >/dev/null 2>&1; then
  alias services='systemctl list-units --type=service --state=running'
  alias status='systemctl status'
  alias start='sudo systemctl start'
  alias stop='sudo systemctl stop'
  alias restart='sudo systemctl restart'
  alias enable='sudo systemctl enable'
  alias disable='sudo systemctl disable'
  alias journal='journalctl -u'
  alias reboot='sudo reboot'
  alias poweroff='sudo poweroff'
  alias suspend='sudo systemctl suspend'
  alias hibernate='sudo systemctl hibernate'
fi

command -v dmesg >/dev/null 2>&1 && alias dmesg='dmesg | tail -50'
command -v ps >/dev/null 2>&1 && alias topcpu='ps aux --sort=-%cpu | head -10'
command -v ps >/dev/null 2>&1 && alias topmem='ps aux --sort=-%mem | head -10'

# Kernel module toggle for VirtualBox/KVM coexistence.
# Defined unconditionally on Linux, as in the original; the module name comes
# from the CPU vendor instead of being hardcoded to Intel.
if command -v modprobe >/dev/null 2>&1; then
  if grep -qi '^vendor_id.*AMD' /proc/cpuinfo 2>/dev/null; then
    _anoraK_kvm=kvm_amd
  else
    _anoraK_kvm=kvm_intel
  fi
  alias kvm-on="sudo modprobe $_anoraK_kvm && echo \"KVM ON - unload before VirtualBox\""
  alias kvm-off="sudo modprobe -r $_anoraK_kvm kvm && echo \"KVM OFF - VirtualBox ready\""
  unset _anoraK_kvm
fi
