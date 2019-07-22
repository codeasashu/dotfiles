# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#export PATH=/home/ashutosh/.local/bin/aws_completer:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
#export TERM="screen-256color"
export TERM="xterm-256color"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

#POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  os_icon
  virtualenv
  dir
  vcs
)

POWERLEVEL9K_PYTHON_ICON=🐍
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)
#source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
#ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  kubectl
  virtualenv
  web-search
)

source $ZSH/oh-my-zsh.sh
source /usr/bin/aws_zsh_completer.sh
source /usr/share/autojump/autojump.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH=~/.local/bin:$PATH:~/terraform
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(fasd --init auto)"
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias docwork='docker-compose exec workspace bash'
alias sshlfk="ssh -i ~/.ssh/newtempvol.pem ec2-user@devportal.lionheartfitnesskids.com"
alias sshlfkprod="ssh -i ~/.ssh/newtempvol.pem ec2-user@coach.lionheartfitnesskids.com"
alias startphp='docker-compose up -d nginx php-fpm mariadb'
alias sshdockertest='ssh -i ~/.ssh/id_rsa ashutosh@13.127.27.12'
alias dev='docker-compose exec workspace bash'

alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="nvim"
alias sv="sudo nvim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias mkd="mkdir -pv"
alias neton="sudo netctl start $1"
alias netoff="sudo netctl stop $1"


# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias starwars="telnet towel.blinkenlights.nl"
alias gaana="youtube-viewer -A -n -4 $1 --results=1 --video-player=mpv"
alias joke="$HOME/.config/neofetch/surprise.sh 'jokes'"
alias rr="rm -rf"
alias sz="du -sh"
alias enterdocker="docker exec -it $1"
alias keymd5="ssh-keygen -l -E md5 -f $1"
alias dc="docker-compose"
function searchip() {
    ag -B 1 -A2 --nonumbers -i "$1" ~/.ssh/config | awk NF | grep Host
}

#alias chgwal="wal -i $HOME/Wallpapers -o ${HOME}/wal-set"
wal-tile() {
    wal -n -i "$@"
    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}
#(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

neofetch

# If mikikube is there, change docker env
#if hash minikube 2>/dev/null; then
#    eval $(minikube docker-env)
#fi;

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/ashutosh/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/ashutosh/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/ashutosh/node_modules/tabtab/.completions/sls.zsh ]] && . /home/ashutosh/node_modules/tabtab/.completions/sls.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias sshgaanapapi="ssh -i ~/.ssh/gaanaptempvol.pem ec2-user@api.gaanap.com"
alias sshgaanapapidev="ssh -i ~/.ssh/gaanaptempvol.pem ec2-user@dev.api.gaanap.com"
alias sshessaycratewp="ssh -i ~/.ssh/wpessaycrate.pem essayc9@199.250.194.143 -p 2222"
alias getip="ip addr | grep -e 'wl*' | xargs | grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\/24\b' | cut -d'/' -f1"
alias composer='docker run -v $(pwd):/var/www/html myop/php-cli:5.6 composer'
alias php='docker run --net=host -v $(pwd):/var/www/html myop/php-cli:5.6 php'
alias php7='docker run --net=host -v $(pwd):/var/www/html localhost/php7 php'
alias phpunit='docker run --net=host -v $(pwd):/var/www/html myop/php-cli:5.6 phpunit'
alias phpunit7='docker run --net=host -v $(pwd):/var/www/html localhost/php7 phpunit'

# Log filtering aliases
function apc_ipfilter() {
    grep -Rw "$1" "$2" | cut -d':' -f1 | cut -d' ' -f1 | sort -u
}
function apc_ipurl() {
    cat "$1" | awk -F '"' '{print $1 $2}' | awk -F' ' '{print $1" " $7}' | sort -u
}

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
