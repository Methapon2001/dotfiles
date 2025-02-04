# Methapon2001's dotfiles

## Packages

- [uv](https://github.com/astral-sh/uv)
- [yazi](https://yazi-rs.github.io/)
- [fish](https://fishshell.com/)
- [starship](https://starship.rs/)
- [lsd](https://github.com/lsd-rs/lsd)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [node.js](https://nodejs.org/)
- [rust-toolchain](https://www.rustup.rs/)
- [neovim](https://neovim.io/)

## Config

1. Clone repository: `git clone https://github.com/Methapon2001/dotfiles.git ~/.dotfiles`
2. Create symbolic link for each config.

### Fish Shell

Symbolic Link Config File: `ln -s ~/.dotfiles/fish/config.fish ~/.config/fish/config.fish`

### Terminal File Manager Yazi

Symbolic Link Config File: `ln -s ~/.dotfiles/yazi ~/.config/yazi`
Run Command: `ya pack -i`
Update with: `ya pack -u`

### Starship Cross-Shell Prompt

Symbolic Link Config File: `ln -s ~/.dotfiles/starship.toml ~/.config/starship.toml`

### Neovim PDE

Neovim Symbolic Link Config File: `ln -s ~/.dotfiles/nvim ~/.config/nvim`
EditorConfig: `ln -s ~/.dotfiles/.editorconfig ~/.editorconfig`

### Lazygit

Symbolic Link Config File: `ln -s ~/.dotfiles/lazygit/config.yml ~/.config/lazygit/config.yml`

### Zellij Terminal Multiplexer

Symbolic Link Config File: `ln -s ~/.dotfiles/zellij ~/.config/zellij`
