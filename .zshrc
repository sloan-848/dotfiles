#
## User-defined functions
# 

# add colored manpages
man() {
	env \
		LESS_TERMCAP_md=$'\e[1;36m' \ LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[1;40;92m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[1;32m' \
		man "$@"
}

# add push notifications over Pushover
push() {
  curl -s -F "token=afgq15q22847cg8e1xjpmjfug5ran3" -F "user=u2f4smknjr4z5mhc3xque2jzp7ap7n" -F "title=RandomServer" -F "message=$1" https://api.pushover.net/1/messages.json
}

# print some wisdom by our favorite horse
cowspeakfortune() {
	h=`date +%H`
	# If early morning (middle of the night)
	if [ $h -lt 06 ]
	then
			cowargs="-s"
	# If mid to late morning
	elif [ $h -lt 12 ]
	then
			cowargs="-t"
	# If early afternoon
	elif [ $h -lt 16 ]
	then
			cowargs=""
	# If mid morning
	elif [ $h -lt 20 ]
	then
			cowargs="-g"
	# If mid morning
	elif [ $h -lt 24 ]
	then
			cowargs="-b"
	# If we missed a case
	else
			cowargs="-d"
	fi

	# Now print motd
  echo $fg[cyan]
  fortune -s | cowsay $cowargs
	echo ""
}


#
## Oh-My-Zsh Configuration
#

# path to your oh-my-zsh installation.
export ZSH=/Users/will/.oh-my-zsh

# set name of the theme to load.
ZSH_THEME="maran"

# uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# uncomment the following line to display red dots whilst waiting for completion.
#COMPLETION_WAITING_DOTS="true"

# uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# increase History Length
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo)

# source oh-my-zsh setup
source $ZSH/oh-my-zsh.sh


#
## User configuration
#

# export GOPATH for Go
export GOPATH=$HOME/Documents/Developer/go

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$GOPATH/bin:/Users/will/local/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/opt/local/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin:/opt/metasploit-framework/bin/:$PATH"

# set up completion for aws
source /usr/local/share/zsh/site-functions/_aws

# make sure we're always editing in vim #vimmasterrace
export EDITOR='vim'

# alias common commands
alias dusort="du -sh * | sort -h"
alias utime="date +%s"
alias ipecho="curl ipecho.net/plain"
alias sourcez="source ~/.zshrc"
alias grep="grep -i"
alias watch="watch -n1"
alias ls="ls --color"

#
## finalizer
#

# print fortune each time a zsh shell is opened (if the necessary programs are installed)
if hash fortune 2>/dev/null && hash cowsay 2>/dev/null; then
		cowspeakfortune
else
		echo "You do not have fortune or cowspeak installed, sorry"
fi