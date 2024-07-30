# `dotfiles` for txj-xyz
This repo uses [chezmoi](https://chezmoi.io/) for management of `$HOME` dotfiles.

# Setup a new machine with this repo

After having `chezmoi` installed run the following command to pull down the repo's latest changes to the new machine and apply them to your `$HOME` dir

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply txj-xyz
```

