eval "$(starship init zsh)"
eval "$(zellij setup --generate-auto-start zsh)"

# settings
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# completion
autoload -Uz compinit
compinit

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# android sdk
export ANDROID_HOME="$HOME/application/android/sdk"
export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# flutter
export PATH="$HOME/application/flutter/bin:$PATH"

# pnpm
export PNPM_HOME="/home/alpine/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
alias pn="pnpm"
# pnpm end

alias ls='lsd --group-directories-first'
alias l='ls -l --group-directories-first'
alias la='ls -a --group-directories-first'
alias lla='ls -la --group-directories-first'
alias lt='ls --tree --group-directories-first'
