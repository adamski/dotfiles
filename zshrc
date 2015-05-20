# Path to your oh-my-zsh installation.
export ZSH=/Users/adamelemental/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export NDK_MODULE_PATH=~/dev/Android/modules/aubio-android
export PATH=$PATH:~/dev/SDKs/android-sdk/platform-tools

source $ZSH/oh-my-zsh.sh

source ~/.oh-my-zsh/custom/plugins/opp.zsh/opp.zsh

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
        RPS1="${${KEYMAP/(vicmd|opp)/$VIM_PROMPT}/(main|viins)/}"
            zle reset-prompt

}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=20
bindkey -v

# bindkey "^[[A" history-beginning-search-backward
# bindkey "^[[B" history-beginning-search-forward

# History Search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey  '^[[A'  history-beginning-search-backward-end
bindkey  '^[[B'  history-beginning-search-forward-end

#
# bindkey "${key[Up]}" up-line-or-local-history
# bindkey "${key[Down]}" down-line-or-local-history
#
# up-line-or-local-history() {
#     zle set-local-history 1
#     zle up-line-or-history
#     zle set-local-history 0
# }
# zle -N up-line-or-local-history
# down-line-or-local-history() {
#     zle set-local-history 1
#     zle down-line-or-history
#     zle set-local-history 0
# }
# zle -N down-line-or-local-history
#
# bindkey "^[[1;5A" up-line-or-history    # [CTRL] + Cursor up
# bindkey "^[[1;5B" down-line-or-history  # [CTRL] + Cursor down"]]]]"

# Use jk for ESC
# bindkey -M viins 'jk' vi-cmd-mode
#
# # Use vim cli mode
# bindkey '^P' up-history
# bindkey '^N' down-history
#
# # backspace and ^h working even after returning from command mode
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
#
# # ctrl-w removed word backwards
# bindkey '^w' backward-kill-word
#
# # ctrl-r starts searching history backward
# bindkey '^r' history-incremental-search-backward

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
