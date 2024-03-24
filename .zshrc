# settings
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# completion
autoload -Uz compinit
compinit

eval "$(starship init zsh)"
eval "$(zellij setup --generate-auto-start zsh)"
eval "$(zoxide init --cmd cd zsh)"

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# android sdk
export ANDROID_HOME="$HOME/application/android/sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
# flutter
export PATH="$HOME/application/flutter/bin:$PATH"
# cargo
export PATH="$HOME/.cargo/bin:$PATH"

alias pn="pnpm"
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# pnpm
export PNPM_HOME="/home/methapon/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
