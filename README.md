# `dotfiles` for txj-xyz
This repo uses [chezmoi](https://chezmoi.io/) for management of `$HOME` dotfiles.

# Required files
## Fonts:

- [Hack Nerd Font Mono](https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-7-install-script) 

# Setup a new machine with this repo

## Homebrew:

Download and install Homebrew, once installed you can run: `brew bundle ./bin/Brewfile`

## Chezmoi

Download and install Chezmoi, once you have done so you can apply a new machine and the settings with the following command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txj-xyz
```

## Done! Enjoy

# Updating files / editing

If you want to apply your new updates to tracked files, run:

```bash
# If you updated local files instead of chezmoi, run this
chezoi re-add

# If you updated with `chezmoi cd; nvim`
chezmoi apply

# Edit directly and apply
chezmoi edit ~/.zshrc; chezmoi apply
```
