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

alias exa='exa --all --icons --group-directories-first'
alias e='exa'
alias ls='exa'
alias ll='exa -l'
alias l='exa -l'
alias la='exa -l'

alias t='tmux'
alias tls='tmux ls'
alias ta='tmux attach'
alias td='tmux detach'
alias tks='tmux kill-server'

alias g='lazygit'
alias lg='lazygit'
alias gs='git status'
alias gf='git fetch'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'
alias gl='git log'

alias update='sudo nala update && sudo nala upgrade -y' # Maybe change over to deb update since that pulls apt update?
alias deb='sudo deb-get'
alias oldsizes='du -shc -- * | sort -h' # Shows sizes of folders, sorted ascendingly, may require sudo, if you want descending, do sort -rh (r is for reverse), remove c from -shc to remove total
alias sizes='dua'
alias sizesinteractive='dua i'
alias ffmpeg='ffmpeg -hide_banner'
alias f='ffmpeg -hide_banner'
alias mc='cd ~/Games/ && java -jar TLauncher.jar && exit'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'
alias kwinwhereyouat='setsid kwin_x11 --replace &' # Restarts KWin
alias plasmawhereyouat='kquitapp5 plasmashell && kstart5 plasmashell' # Restarts Plasma
alias ch='cd ~/Games/Clone\ Hero && ./clonehero && exit'
alias obsisdead='pkill obs && sudo modprobe -r v4l2loopback' # Virtual Camera Fix
alias notion='notion-app-enhanced'
alias pipes='cd /usr/local/bin && ./pipes.sh'
alias lpf='sh ~/scripts/lpf.sh'
alias upf='sh ~/scripts/upf.sh'
alias mvnfull='mvn clean install -DskipTests'
alias python='python3' # No need for python-is-python3
alias p='ipython3 --no-banner --no-confirm-exit'
alias switchjava='sudo update-alternatives --config java'
alias switchjavac='sudo update-alternatives --config javac'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dotdesktops='echo "/usr/share/applications/ <-- Most of the stuff"\n"~/.local/share/applications <-- Mainly Proton and Wine"\n"/var/lib/flatpak/exports/share/applications/ <-- For Flatpaks"'
alias fd='fd -H' # Package is fd-find, fd is the command, -H is to include hidden files
alias typeracer='toipe'
alias shortcuts='nvim ~/.dotfiles/README.md'
alias nf='neofetch'
alias rx='rxfetch'
alias colors='gpick'
alias nsx='nsxiv-rifle'
alias vim='nvim'
alias v='nvim'
alias sound='pavucontrol-qt'
alias dc='setsid discord --enable-gpu-rasterization --disable-smooth-scrolling' # setsid launches it detached from terminal
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias pomo='bash ~/scripts/pomodoro.sh'

alias upscale='~/Desktop/upscaler/upscale.sh'

# PATH configuration - fish_add_path is the same as export PATH in bash
fish_add_path /home/stankovictab/.spicetify/
fish_add_path /home/stankovictab/scripts/
fish_add_path /home/stankovictab/.cargo/bin/

export EDITOR="nvim" # Default editor for sudoedit for example
