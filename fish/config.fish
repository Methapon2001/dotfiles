set -gx EDITOR nvim

zoxide init --cmd cd fish | source
starship init fish | source

alias ls="eza --group-directories-first --icons always"
alias l="eza --group-directories-first -l"
alias la="eza --group-directories-first -a"
