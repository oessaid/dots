# Dotfiles configuration

## Showcase

`Neovim` inside `tmux` inside `kitty` inside `yabai` on MacOS.

<img width="3004" alt="image" src="https://user-images.githubusercontent.com/35626945/223049221-47441958-42d4-4b27-a2d5-ee701cce0c0f.png">

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
