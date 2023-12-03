# Dotfiles

## Prerequisite

- zsh, zsh-syntax-highlighting[^1], zsh-autosuggestions[^2], Starship
- lsd
- Node.js, npm
- Neovim

## Config

- ZSH: `ln -s ~/dotfiles/.zshrc ~/.zshrc` - Contain preconfigured path (flutter, android toolchain), config (Starship, Zellij) and alias (lsd, pnpm).
- Starship: `ln -s ~/dotfiles/starship.toml ~/.config/starship.toml`
- Neovim (PDE): `ln -s ~/dotfiles/nvim ~/.config/nvim`
- EditorConfig: `ln -s ~/dotfiles/.editorconfig ~/.editorconfig`
- Zellij: `ln -s ~/dotfiles/zellij ~/.config/zellij`
- GnuPG (WSL w/ Gpg4win): `cp ~/dotfiles/.gnupg ~/.gnupg`

[^1]: Script install at `/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh`. This is based on path install by using apk in Alpine Linux.
[^2]: Script install at `/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh`. This is based on path install by using apk in Alpine Linux.
