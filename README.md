# dev files

Uses Git to track linux/unix dot files for dev, with no symlinks. Uses a bare Git repo. Setting work-tree to `$HOME`. Not showing untracked files.

*(Code blocks are fish shell.)*

## Vim 8

A simplistic and minimal vimrc boilerplate.

Packages (plugins) are installed/updated with `:PackagerInstall`/`:PackagerUpdate`.

- Package management requires https://github.com/kristijanhusak/vim-packager
- Requries FZF on your system for fuzzy searching. Ripgrep on your system is optional. (See https://github.com/junegunn/fzf.vim)
	Includes MUcomplete. Alternatives: https://github.com/prabirshrestha/asyncomplete.vim

## Git use

Clone:

```fish
git clone --bare git@github.com:jssteinberg/.dev.git $HOME/.dev.git
```

Local setup:

```fish
alias dev 'git --git-dir=$HOME/.dev.git/ --work-tree=$HOME'
funcsave dev
dev checkout
dev config --local status.showUntrackedFiles no
```

*You may have to remove some files before checkout.*

Add and update:

```fish
dev status
dev add file1 file2
dev commit -m "Updated dev files"
dev push
```

## Init and config

Initial setup and first time configuration.

1. Init a bare repository

	```fish
	git init --bare $HOME/.dev.git
	```

2. Alias `dev` as your `git` command for dot files.

	```fish
	alias dev 'git --git-dir=$HOME/.dev.git/ --work-tree=$HOME'
	```

3. Globally save alias.

	```fish
	funcsave dev
	```

4. Set to not show untracked files.

	```fish
	dev config --local status.showUntrackedFiles no
	```
