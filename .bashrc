#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias hx='helix'
alias ls='eza --icons'
alias cr='cargo run'
alias cb='cargo build'
alias crc='cargo clippy'
alias ct='cargo test'
alias cf='cargo fmt'

alias cat='bat --style plain --pager never --theme=OneHalfDark'
alias catl='bat --theme=OneHalfDark'
alias cpstd='python3 ~/programming/c/cp/utils/debugging/cf_template.py'
alias csstd='NOTC=1 cpstd'
alias dbgrun='python3 ~/programming/c/cp/utils/debugging/cfdbg.py'

# Bash appearance
PS1="\n\e[0;34m\w\e[0m\n> "

# Cargo
. "$HOME/.cargo/env"

# z
. ~/tools/z/z.sh

# fzf
FZF_ALT_C_COMMAND=
FZF_CTRL_T_COMMAND=
eval "$(fzf --bash)"

# Solve locale issue
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


# fnm
FNM_PATH="/home/manikya/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
