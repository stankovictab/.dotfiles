# Git Integration
# vcs_info (Version Control System Info) is the integrated framework to get the git information,  we don’t need a seperate script
autoload -Uz vcs_info
precmd() { vcs_info }
# Formatting the vcs info
# %b = branch, %u = are there unstaged changes, %c = are there staged changes
# check-for-changes will update %c and %u
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{yellow} ×'
zstyle ':vcs_info:*' stagedstr '%F{green} ×'
zstyle ':vcs_info:git:*' formats '(%b%c%u%F{cyan})'
# Enabling substitutions in the prompt
setopt prompt_subst

# %F{colorNameOrCode} starts the color, %f resets it, same for bold with %B and %b
# PROMPT needs to be defined with '' instead of "" in order for git to work properly
PROMPT='%B%F{green}%~ %F{cyan}${vcs_info_msg_0_}%f%b
'

# An easy check to see if you're working with a color terminal,
# instead of doing the weird .bashrc way,
# is to do the tput colors command - if it's 256, it's color, if it's 8, it's not 
colors=$(tput colors)
if [ ${colors} = 256 ]
  then
  	# Root user check
	if [ "$EUID" -ne 0 ]
	  then 
	  	PROMPT+='🦩 '
	  else 
	  	PROMPT+='💀 '
	fi
  else
    # % for user, # for root
    echo
	echo "I see you're using an 8 color terminal, I'll switch over to an 8 color zsh theme."
	fast-theme mgz-8-color
  	PROMPT+='%# '
fi

# Use Emacs over Vim editing
bindkey -e

# CTRL+Arrows to move through command line
# To see the shortcut in this format, run cat and press the shortcut you want
# To see all zsh keybinds, run bindkey
# CTRL + RIGHT
bindkey "^[[1;5D" backward-word 
# CTRL + LEFT
bindkey "^[[1;5C" forward-word 
# CTRL + BACKSPACE
bindkey "^H" backward-kill-word
# CTRL + DELETE
# forward-kill-word doesn't exist
bindkey "^[[3;5~" kill-word 

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# Ignore duplicate commands in history (but don't share it between terminals)
setopt HIST_IGNORE_ALL_DUPS 
# Append to history file on every command, don't overwrite
setopt INC_APPEND_HISTORY

# No need for cd to go into folder (if a command by that name doesn't exist already)
setopt autocd
# Removing beep
unsetopt beep

# Completion
# This line makes cd case insensitive
zstyle ':completion:*' matcher-list '' '+m:{a-zA-Z}={A-Za-z}' '+r:|[._-]=* r:|=*' '+l:|=* r:|=*'
# ?
autoload -Uz compinit
compinit

# Autosuggestions
# To fill the autosuggestion, press Right Arrow or End
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Autosuggest color set to 000 (black), because 8 color terminals will show white instead, they don't have grey (default is 008, which is in the 256 color scope)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=000"

# Pick one of these (I recommend F-Sy-H) :
# Syntax Highlighting
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Fast Syntax Highlighting
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Disable highlight on paste
zle_highlight=('paste:none')

# Aliases

alias c='clear'
alias ..='cd ..'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
# l = All in one column, a = All, including hidden, h = Human readable sizes
alias lah='ls -lah --color=auto'
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias sizes='du -sh *'

# Automatically ls after cd
# function cd {
#     builtin cd "$@" && ls -F
# }

alias update='sudo apt update && sudo apt upgrade -y'
alias deb='sudo deb-get'
alias ffmpeg='ffmpeg -hide_banner'
alias mc='cd ~/Gaming/ && java -jar TLauncher.jar && exit'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
# TODO: spicetify is inserted into PATH by default now, so this is no longer needed
alias spicetify='~/spicetify-cli/spicetify'
alias kwinwhereyouat='setsid kwin_x11 --replace &' # Restarts KWin
alias plasmawhereyouat='kquitapp5 plasmashell && kstart5 plasmashell' # Restarts Plasma
alias ch='cd ~/Gaming && ./Clone\ Hero\ Launcher.AppImage'
alias obsisdead='pkill obs && sudo modprobe -r v4l2loopback' # Virtual Camera Fix
alias n='notion-app-enhanced'
alias pipes='cd /usr/local/bin && ./pipes.sh'
alias lpf='sudo chown root:root ~/Documents/Private'
alias upf='sudo chown stankovictab:stankovictab ~/Documents/Private'
alias mvnfull='mvn clean install -DskipTests'
alias p='ipython3 --no-banner --no-confirm-exit'
alias switchjava='sudo update-alternatives --config java'
alias switchjavac='sudo update-alternatives --config javac'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dotdesktops='cd ~/.local/share/applications && dolphin .'
alias yt='yt-dlp'
alias fd='fdfind'