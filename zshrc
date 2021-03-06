# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jspong/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws git docker mvn python sudo vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias dkcpup="docker-compose up -d"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"

export PATH=/Users/jspong/bin:$PATH
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

function gitd () {
    cd "$HOME/github/confluent/$1"
}

function gpo () {
    BRANCH=${1:-$(git rev-parse --abbrev-ref HEAD)}
    git push -u origin ${BRANCH}
}

function rebase-branch() {
    BRANCH=${1:-$(git rev-parse --abbrev-ref HEAD)}
    ROOT=${2:-master}
    git rebase -i $(git merge-base $ROOT $BRANCH)
}

function pwb() {
    git branch | grep '*' | cut -d' ' -f2
}

function unpushed() {
    BRANCH=${1:-`pwb`}
    REMOTE=${2:-origin}
    git log ${REMOTE}/${BRANCH}..HEAD
}

function notes() {
    GITDIR=${HOME}/github/jspong/notes
    PREV_DIR=$PWD
    cd $GITDIR

    git commit --all --message="Cleaning up lingering notes" 2>&1 >/dev/null

    1=${1:-today}
    DATE=$(python -c "from dateparser import parse; print(parse('$1').strftime('%F'))")
    if [ $? -eq 1 ]
    then
        cd $PREV_DIR
        return 1
    fi

    NOTES=${DATE}.md
    touch ${NOTES}
    git add ${NOTES}
    vim ${NOTES}
    git diff | grep +todo: | sed "s/+todo:/- [ ] ($DATE):/" >> todo.md
    git diff | grep +progress: | sed "s/+progress:/- progress $DATE:/" >> ppp.md
    git diff | grep +problem: | sed "s/+problem:/- problem $DATE:/" >> ppp.md
    git diff | grep +plan: | sed "s/+plan:/- plan $DATE:/" >> ppp.md
    git diff | grep +buy: | sed "s/+buy: \(.*\)/- [ ] \1 <!-- $DATE -->/" >> shopping_list.md

    MSG="Notes for ${DATE:-$1}"
    git commit --all --message=${2:-$MSG} 2>&1 >/dev/null
    cd $PREV_DIR
}

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
