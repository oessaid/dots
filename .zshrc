# zmodload zsh/zprof
source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle sudo
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

_comp_options+=(globdots)		# Include hidden files.
# zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select

# Bindings for history-substring-search
bindkey "$terminfo[kcuu1]" history-substring-search-up # workaround for up arrow
bindkey "$terminfo[kcud1]" history-substring-search-down # workaround for down arrow
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Remove underline for syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Vim mode
bindkey -v

# This is due to a bug Debian introduced with their Bash 4.4 release, which removed $HOME/.local/bin from the PATH. This bug was later fixed on Debian and Ubuntu. Sadly, Ubuntu reitroduced this bug and is yet to fix it.
export PATH=$HOME/.local/bin:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export VISUAL="nvim"
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# npm custom install folder
export PATH=~/.npm-global/bin:$PATH

# dotfiles management:
# --git-dir    : this is where the History lives
# --work-tree  : this is where the snapshot (working tree) lives
# Note: ~/.dotfiles is a bare git repo
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

alias zshconfig="nvim ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias open='xdg-open'
alias ls="exa --color=always --git --group-directories-first --classify --icons"
alias lsa="exa -a --color=always --git --group-directories-first --classify --icons"
alias ll="exa --color=always --octal-permissions --git --group-directories-first --classify --icons --long"
alias ee="ranger"
# Tree view: use as `lt 3 <folder>` for a 3 level tree of <folder>
alias lt="exa -a --color=never --git --tree --octal-permissions --long --header --group-directories-first --icons"
alias tns="tmux new -s"
alias tls="tmux ls"
alias tat="tmux a -t"
# alias bt="bluetoothctl"
# alias bt="rofi-bluetooth"
alias dbx="dropbox"
# alias bm="~/bin/fzfbuku"
# alias color="colorpicker --short --one-shot --preview | xsel -b"
alias lldb-vscode="/usr/bin/lldb-vscode-10"
# alias clang="/usr/bin/clang-12"

# Custom fzf command (for hidden files)
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -U -l -g ""' 
# export FZF_DEFAULT_OPTS='--bind='F2:toggle-preview' --preview "bat --style=numbers --color=always {} | head -500"'
export FZF_DEFAULT_OPTS='--bind='F2:toggle-preview''
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias luamake=/home/omar/software/lua-language-server/3rd/luamake/luamake

# # additional completions
# zmodload zsh/complist
# # # compinit
 
# Git GPG
export GPG_TTY=$(tty)

eval "$(starship init zsh)"
# zprof
