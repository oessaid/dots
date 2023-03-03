# Dotfiles configuration

## Installing in a new system

Clone the repo into a bare repository inside `$HOME`:

```sh
git clone --bare git@github.com:oessaid/dots.git $HOME/.dotfiles
```

Define the management command alias (`dots`) inside the current shell scope:

```sh
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
```

Checkout the actual content from the bare repository to $HOME

```sh
dots checkout
```

Errors might pop up at this point because `$HOME` might have some stock versions of configuration files (`.bashrc`, `.zshrc`, etc.). Delete them (or back them up), then re-run the above command.

Ignore any untracked files (to avoid unnecessary clutter of `dots status`) using

```sh
dots config --local status.showUntrackedFiles no
```

## Usage

Updating dotfiles and pushing changes becomes very easy:

```sh
dots status
dots add .zhsrc
dots commit -m "Add .zshrc"
dots push
```
