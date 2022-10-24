### Keybindings

# To see the bind you want, run `fish_key_reader`
# To see the available binds, go to https://fishshell.com/docs/current/cmds/bind.html
# Ctrl + Backspace
bind \b backward-kill-word
# Ctrl + Delete
bind \e\[3\;5~ kill-word
# Shift + Enter
if test "$TERM" = "xterm-256color" # Konsole
    bind -k enter accept-autosuggestion execute
else if test "$TERM" = "xterm-kitty" # Kitty
	# TODO: Kitty can't distinguish Shift + Enter from just Enter, both are "\r"
    # bind \r accept-autosuggestion execute 
else # TMUX
    bind \n accept-autosuggestion execute
end

### Aliases

alias fishrc='nvim ~/.config/fish/config.fish'
alias reload='source ~/.config/fish/config.fish'

alias c='clear'
alias :q='exit'
alias ..='cd ..'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lah='ls -lah --color=auto' # l = All in one column, a = All, including hidden, h = Human readable sizes
alias bat='batcat'

alias exa='exa --all --icons --group-directories-first'
alias e='exa'
alias ls='exa'
alias ll='exa -l'
alias l='exa -l'
alias la='exa -l'

alias t='tmux'
alias ts='tmux ls'
alias tls='tmux ls'
alias ta='tmux attach'
alias td='tmux detach'
alias tks='tmux kill-server'

alias g='lazygit'
alias lg='lazygit'
alias gs='git status'
alias ga='git add .'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'

alias update='sudo apt update && sudo apt upgrade -y'
alias deb='sudo deb-get'
alias sizes='sudo du -sh *'
alias ffmpeg='ffmpeg -hide_banner'
alias mc='cd ~/Gaming/ && java -jar TLauncher.jar && exit'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias kwinwhereyouat='setsid kwin_x11 --replace &' # Restarts KWin
alias plasmawhereyouat='kquitapp5 plasmashell && kstart5 plasmashell' # Restarts Plasma
alias ch='cd ~/Gaming && ./Clone\ Hero\ Launcher.AppImage'
alias obsisdead='pkill obs && sudo modprobe -r v4l2loopback' # Virtual Camera Fix
alias notion='notion-app-enhanced'
alias pipes='cd /usr/local/bin && ./pipes.sh'
alias lpf='sudo chown root:root ~/Documents/Private && pkill nomacs && pkill mpv'
alias upf='sudo chown stankovictab:stankovictab ~/Documents/Private'
alias mvnfull='mvn clean install -DskipTests'
alias python='python3' # No need for python-is-python3
alias p='ipython3 --no-banner --no-confirm-exit'
alias switchjava='sudo update-alternatives --config java'
alias switchjavac='sudo update-alternatives --config javac'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dotdesktops='cd ~/.local/share/applications && dolphin .'
alias fd='fdfind -H' # -H is to include hidden files
alias typeracer='toipe'
alias shortcuts='nvim ~/.dotfiles/README.md'
alias nf='neofetch'
alias rx='rxfetch'
alias colors='gpick'
set res $(xdpyinfo | awk '/dimensions/{print $2}')
alias nsx='nsxiv -a -b --anti-alias=no -g $res' # -a to play gifs, -b to hide status bar, -g to maximize
alias vim='nvim'
alias v='nvim'
alias sound='pavucontrol-qt'
alias dc='discord --enable-gpu-rasterization --disable-smooth-scrolling'

# PATH configuration - fish_add_path is the same as export PATH in bash
fish_add_path /home/stankovictab/.spicetify

export EDITOR="nvim" # Default editor for sudoedit for example
