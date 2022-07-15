# dotfiles

## Installation
1. Clone this repo
```sh
git clone --recurse-submodules https://github.com/arkinmodi/dotfiles.git ~/.dotfiles
```

2. Install `GNU stow` and `neovim`
```sh
brew install stow neovim
```

3. Setup symlinks
```sh
sh install.sh
```

## Install JDTLS
[JDTLS](https://github.com/eclipse/eclipse.jdt.ls) is the Java LSP from Eclipse. This requires `wget`.
```sh
sh install_java_lsp.sh
```

## Setting Up tmux on macOS
https://gist.github.com/joshuarli/247018f8617e6715e1e0b5fd2d39bb6c