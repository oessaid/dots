# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
zstyle ':znap:*' repos-dir ~/.config/zsh-snap-plugins
source ~/.config/zsh-snap/znap.zsh

# Uncomment for profiling
# zmodload zsh/zprof

# Download Znap, if it's not there yet.
[[ -f ~/.config/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh-snap/


# znap source marlonrichert/zsh-autocomplete
# znap source zsh-users/zsh-completions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
znap source zsh-users/zsh-autosuggestions
# unset ZSH_AUTOSUGGEST_USE_ASYNC

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting
# Remove underline for syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_FUZZY=true
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=blue,fg=white,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'

# Custom fzf command (for hidden files)
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -U -l -g ""' 
# export FZF_DEFAULT_OPTS='--bind='F2:toggle-preview' --preview "bat --style=numbers --color=always {} | head -500"'
# export FZF_DEFAULT_OPTS='--bind='F2:toggle-preview''
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
znap source Aloxaf/fzf-tab
# use tmux popup for completion results
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# increase minimal popup window size
zstyle ':fzf-tab:*' popup-min-size 50 8
zstyle ':fzf-tab:*' popup-pad 30 0
# lines occupied by fzf's prompt
zstyle ':fzf-tab:*' fzf-pad 4
# trigger for continuous completion
zstyle ':fzf-tab:*' continuous-trigger '/'

# zstyle ':autocomplete:*' fzf-completion yes
# zstyle ':autocomplete:*' list-lines 10
# zstyle ':autocomplete:*' widget-style menu-select

# `znap function` lets you lazy-load features you don't always need.
# lazy-load pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv
znap function _pyenv_virtualenv pyenv_virtualenv '$(pyenv virtualenv-init -)'
compctl -K    _pyenv_virtualenv pyenv_virtualenv

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export VISUAL="nvim"
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export LC_CTYPE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# npm custom install folder
export PATH=~/.npm-global/bin:$PATH

# dotfiles management:
# --git-dir    : this is where the History lives
# --work-tree  : this is where the snapshot (working tree) lives
# Note: ~/.dotfiles is a bare git repo
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'

alias zshconfig="nvim ~/.zshrc"
alias vim="nvim"
alias vi="nvim"
alias ls="exa --color=always --octal-permissions --git --group-directories-first --classify --long"
alias la="exa -a --color=always --octal-permissions --git --group-directories-first --classify --long"
alias ll="exa -a --color=always --octal-permissions --git --group-directories-first --classify --long"
alias ee="ranger"
# Tree view: use as `lt 3 <folder>` for a 3 level tree of <folder>
# alias lt="exa -a --color=never --git --tree --octal-permissions --long --header --group-directories-first --icons"
alias lt="dust -r"
alias tree="dust -r"
alias cat="bat"
alias tns="tmux new -s"
alias tls="tmux ls"
alias tat="tmux a -t"
alias cf="cd \$(find . -type d -print | fzf)"
alias cw="cd /mnt/c/Users/omare/"
alias sysinfo="macchina"
alias tshark="termshark"
alias za="zathura"
alias mdraw="monodraw"
alias bang="gobang"
alias ctop="ctop -i"

# Rust build cache
export RUSTC_WRAPPER=`which sccache`

# # additional completions
fpath+=~/.zfunc
autoload -U compinit && compinit
 
# Git GPG
export GPG_TTY=$(tty)

# eval "$(starship init zsh)"
znap eval starship 'starship init zsh --print-full-init'
znap prompt

export NVM_DIR="$HOME/.nvm"
znap function _nvm nvm '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"'
compctl -K    _nvm nvm
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# HELSING
alias kw=krakenw
alias fwd=forward-cli

# Uncomment for profiling
# zprof

# pnpm
export PNPM_HOME="/Users/omar.essaid/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
