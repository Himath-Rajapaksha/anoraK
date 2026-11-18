# anoraK/lib/00-log.sh — output helpers

if [[ -t 1 ]]; then
  _R=$'\e[0m'; _OK=$'\e[32m'; _WARN=$'\e[33m'; _ERR=$'\e[31m'; _INFO=$'\e[36m'; _DIM=$'\e[2m'
else
  _R=''; _OK=''; _WARN=''; _ERR=''; _INFO=''; _DIM=''
fi

step() { printf '%s==>%s %s\n'   "$_INFO" "$_R" "$*"; }
log()  { printf '%s  ·%s %s\n'   "$_DIM"  "$_R" "$*"; }
ok()   { printf '%s  ✓%s %s\n'   "$_OK"   "$_R" "$*"; }
warn() { printf '%s  ! %s%s\n'   "$_WARN" "$_R" "$*" >&2; }
dry()  { printf '%s  ~ %s%s\n'   "$_DIM"  "$*" "$_R"; }
die()  { printf '%s  ✗ %s%s\n'   "$_ERR"  "$_R" "$*" >&2; exit 1; }
