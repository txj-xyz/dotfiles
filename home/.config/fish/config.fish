source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
export PATH="$HOME/.local/bin:$PATH"

# --- CUSTOM ALIASES ---
alias q=exit
alias c=clear
alias lg=lazygit

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/txj/.opencode/bin
