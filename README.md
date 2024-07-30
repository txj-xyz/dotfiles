# `dotfiles` for txj-xyz
This repo uses [chezmoi](https://chezmoi.io/) for management of `$HOME` dotfiles.

# Setup a new machine with this repo

After having `chezmoi` installed run the following command to pull down the repo's latest changes to the new machine and apply them to your `$HOME` dir

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txj-xyz
```

# Updating files / editing

If you want to apply your new updates to tracked files, run:

```bash
# If you updated local files instead of chezmoi, run this
chezoi re-add

# If you updated with `chezmoi cd; nvim`
chezmoi apply
```
