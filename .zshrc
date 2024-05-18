# --- LOAD AUTOCOMPLETE HISTORY ---
autoload -U compinit && compinit
# ---------------------------------

export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX=true

ZSH_THEME="agnoster"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh


# --- Custom aliases ---

# MacOS / Linux based Fuzzy Find change directory
if [[ "$(uname -s)" -eq "Darwin" ]]; then
  # MacOS
  alias cdd='cd `find . -type d ! -path "*/Library/*" -o -prune | fzf --preview="ls -la {}"`'
else
  # Linux
  alias cdd='cd `find * -type d | fzf --preview "ls -la {}"`'
fi

#cdd='cd `find . -type d ! -path "*/Library/*" -o -prune | fzf --preview="ls -la {}"`'
alias codef='code `fzf`; exit 0'
alias coded='code `find * -type d | fzf`; exit 0'
alias c='clear'
alias nvimd='nvim `find * -type d | fzf`'
alias nvimf='nvim `fzf`'
alias s='cssh(){ ssh -o "StrictHostKeyChecking no" cmc@"$1" };cssh'
# ----------------------


# --- Load GOLANG ---
export PATH=$PATH:/usr/local/go/bin
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# -------------------
