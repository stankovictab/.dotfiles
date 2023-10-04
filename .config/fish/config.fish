### General Options

export EDITOR="nvim" # Default editor for sudoedit for example

set -g fish_greeting # Removes the fish welcome message

# NOTE: You can use Vim mode by setting fish_vi_key_bindings in the same way

### Keybindings

# To see the bind you want, run `fish_key_reader`
# To see the available binds, go to https://fishshell.com/docs/current/cmds/bind.html

bind \b backward-kill-word # Ctrl + Backspace
bind \e\[3\;5~ kill-word # Ctrl + Delete
bind \cl forward-char # Ctrl + l to autofill (don't need a clear terminal shortcut when I have 'c' alias)
# bind \co forward-char # Ctrl + o to autofill (don't need a clear terminal shortcut when I have 'c' alias)

# Better fzf binds, Ctrl + f for file and folder search, Ctrl + Alt + v for variables, so that you can do Ctrl + v for paste :)
fzf_configure_bindings --directory=\cf --variables=\e\cv 

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

alias zj='zellij'
alias zjls='zellij ls'
alias zja='zellij attach'
alias zjk='zellij k'
alias zjka='zellij ka'

alias update='sudo nala update && sudo nala upgrade -y' # Maybe change over to deb update since that pulls apt update?
alias deb='sudo deb-get'
alias oldsizes='du -shc -- * | sort -h' # Shows sizes of folders, sorted ascendingly, may require sudo, if you want descending, do sort -rh (r is for reverse), remove c from -shc to remove total
# dua doesn't need to be run as sudo, it sees everything
alias sizes='dua'
alias sizesinteractive='dua i'
alias ffmpeg='ffmpeg -hide_banner'
alias f='ffmpeg -hide_banner'
alias mc='cd ~/Games/ && java -jar TLauncher.jar && exit'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' # <3
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
alias rg='rg --no-ignore --hidden' # Includes hidden and git-ignored files
alias typeracer='toipe'
alias shortcuts='nvim ~/.dotfiles/README.md'
alias nf='neofetch'
alias rx='rxfetch'
alias colors='gpick'
alias nsx='nsxiv-rifle'
alias vim='nvim'
alias v='nvim'
alias nvimbackup='nvim -u NONE'
alias sound='pavucontrol-qt'
alias dc='setsid discord --enable-gpu-rasterization --disable-smooth-scrolling' # setsid launches it detached from terminal
alias wezterm='flatpak run org.wezfurlong.wezterm'
alias pomo='bash ~/scripts/pomodoro.sh'
alias mediainfo='mediainfo --ParseSpeed=1' # --ParseSpeed=1 makes it so you can always see Stream Size, for some reason???
alias clear-cache='bash ~/scripts/clear-cache.sh'

alias upscale='~/Desktop/upscaler/upscale.sh'
alias s='~/Apps/spotify_player'
alias sd='cd ~/Desktop/StableDiffusion/stable-diffusion-webui/ && bash webui.sh' # Needs to be a cd because if not, it'll clone the whole repo inside the already cloned repo and make a mess

### Abbreviations
# These are like aliases, but with a little improvement 
# where they're expanded in the shell so you know what the command actually is
# For instance, if you have "gp" as an alias, you wouldn't know if it was git push or git pull

abbr -a g lazygit
abbr -a lg lazygit
abbr -a gs git status
abbr -a gf git fetch
abbr -a gp git pull
abbr -a ga git add
abbr -a gc git commit
abbr -a gC git clone
abbr -a gP git push
abbr -a gl git log
abbr -a gd git diff
abbr -a gco git checkout
abbr -a gb git branch
abbr -a gS git stash
abbr -a gSP git stash pop

### PATH configuration 
# Folders of binaries that can be run from anywhere
# fish_add_path is the same as export PATH in bash

fish_add_path ~/.spicetify/
fish_add_path ~/scripts/
fish_add_path ~/binaries/
fish_add_path ~/.cargo/bin/ # Rust binaries
fish_add_path ~/.local/bin/ # Python's binaries, like syncedlyrics, etc



### Experiments

# ERROR - THIS MAKES IT SO THAT I CAN'T LOG INTO X11 OR WAYLAND! MAJOR ISSUE!
# If zellij is installed, always go into a zellij session, and list sessions if there are many of them
# NOTE - Closing a terminal will note close the session, so make sure to close programs manually, that's on you
# See zj setup --generate-auto-start fish for more info
# set ZELLIJ_AUTO_ATTACH true # Automatically attach to a zellij session if there is one
# set ZELLIJ_AUTO_EXIT true # Automatically exit zellij when all panes are closed - this means you're locked into zj, fyi
# NOTE - Also, this means that can you only have one session? Right?
# if not set -q ZELLIJ # Check if you're in a zellij session already
#     if test "$ZELLIJ_AUTO_ATTACH" = "true"
#         zellij attach -c
#     else
#         zellij
#     end
# 
#     if test "$ZELLIJ_AUTO_EXIT" = "true"
#         kill $fish_pid
