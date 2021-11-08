# dev files

Uses git to track dot files for dev, with no symlinks. Uses a bare Git repo. Setting work-tree to `$HOME`. Not showing untracked files.

*Requires fish shell.*

```fish
git clone --bare <repo-url> $HOME/.dev.git
alias dev 'git --git-dir=$HOME/.dev.git/ --work-tree=$HOME'
funcsave dev
dev checkout
dev config --local status.showUntrackedFiles no
```

*You must perhaps remove some files before checkout.*

## How it's initially done

1. Init a bare repository
2. Alias `dev` as your `git` command for dot files.
3. Globally save alias.
4. Set to not show untracked files.

```fish
git init --bare $HOME/.dev.git
alias dev 'git --git-dir=$HOME/.dev.git/ --work-tree=$HOME'
funcsave dev
dev config --local status.showUntrackedFiles no
```