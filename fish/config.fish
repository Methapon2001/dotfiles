set -g fish_greeting

set -gx EDITOR nvim

zoxide init --cmd cd fish | source
starship init fish | source

alias ls="eza --group-directories-first --icons always"
alias l="eza --group-directories-first -l"
alias la="eza --group-directories-first -a"

# cargo
set -gx PATH $HOME/.cargo/bin $PATH
# cargo end

# pnpm
set -gx PNPM_HOME "/home/methapon2001/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
