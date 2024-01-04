# dotfiles

My personal configuration

## Prerequisite

- [zsh](https://www.zsh.org/)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) [^1]
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) [^2]
- [starship](https://starship.rs/)
- [lsd](https://github.com/lsd-rs/lsd)
- [node.js](https://nodejs.org/en)
- [pnpm](https://pnpm.io/)
- [neovim](https://neovim.io/)

## Config

> [!NOTE] <!-- Markdown Alert Extension Required -->
>
> Adjustments may be necessary when using a different Linux distribution.

- zsh: `ln -s ~/dotfiles/.zshrc ~/.zshrc`
- starship: `ln -s ~/dotfiles/starship.toml ~/.config/starship.toml`
- zellij: `ln -s ~/dotfiles/zellij ~/.config/zellij`
- lsd: `ln -s ~/dotfiles/lsd ~/.config/lsd`
- neovim (PDE): `ln -s ~/dotfiles/nvim ~/.config/nvim`
- EditorConfig: `ln -s ~/dotfiles/.editorconfig ~/.editorconfig`
- GnuPG (WSL w/ Gpg4win): `cp ~/dotfiles/.gnupg ~/.gnupg`

[^1]: Preconfigured `.zshrc` is based on path when installed by apk (alpine package manager).
[^2]: Preconfigured `.zshrc` is based on path when installed by apk (alpine package manager).
