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
bind \ck history-search-backward # Ctrl + k for previous command in history
bind \cj history-search-forward # Ctrl + j for next command in history

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

alias eza='eza --all --icons --group-directories-first'
alias e='eza'
alias ls='eza'
alias ll='eza -l'
alias l='eza -l'
alias la='eza -l'

# Uncomment when on Ubuntu
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

alias deb='sudo deb-get'
alias sizes='gdu'
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
alias mvnfull='mvn clean install -DskipTests'
alias python='python3' # No need for python-is-python3
alias p='ipython3 --no-banner --no-confirm-exit'
alias switchjava='sudo update-alternatives --config java'
alias switchjavac='sudo update-alternatives --config javac'
alias ports='sudo lsof -i -P -n | grep LISTEN'
alias dotdesktops='echo "/usr/share/applications/ <-- Most of the stuff"\n"~/.local/share/applications <-- Mainly Proton and Wine"\n"/var/lib/flatpak/exports/share/applications/ <-- For Flatpaks"\n\n"You can run `sudo update-desktop-database` to update the dotdesktop list of your DE."\n"Make sure that the app and icons are available, if something isn\'t correctly set, the dotdesktop won\'t update."'
alias fd='fd -H'
alias fdfind='fdfind -H'
alias rg='rg --no-ignore --hidden' # Includes hidden and git-ignored files
alias typeracer='toipe'
alias shortcuts='nvim ~/.dotfiles/README.md'
alias fonts='cd /usr/share/fonts/'
alias nf='neofetch'
alias rx='rxfetch'
alias colors='gpick'
alias nsx='nsxiv-rifle'
alias vim='nvim'
alias v='nvim'
alias nvimbackup='nvim -u NONE'
alias sound='pavucontrol-qt'
alias mediainfo='mediainfo --ParseSpeed=1' # --ParseSpeed=1 makes it so you can always see Stream Size, for some reason???
alias music='~/Apps/musikcube/musikcube'

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

abbr -a fav1 f -i in.mkv -c:v libaom-av1 -crf 40 -cpu-used 8 -c:a copy out-aomav1crf40cpu8.mkv
abbr -a f264 f -i in.mkv -c:v libx264 -preset medium -crf 30 -c:a aac out-x264crf30med.mkv
abbr -a f265 f -i in.mkv -c:v libx265 -preset medium -crf 30 -c:a copy out-x265crf30med.mkv

abbr -a fjxl f -i in.png -c:v libjxl -effort 7 -distance 1 out-eff7dist1.jxl
abbr -a favif f -i in.png -c:v libaom-av1 -crf 24 -cpu-used 8 out-crf24cpu8.avif
abbr -a fwebp f -i in.png -c:v libwebp -quality 88 -compression_level 6 out-q88cl6.webp
abbr -a fjpg f -i in.png out.jpg

abbr -a ai ollama run codellama

abbr -a zj zellij
abbr -a zjls zellij ls
abbr -a zja zellij attach
abbr -a zjk zellij kill-session
abbr -a zjka zellij kill-all-sessions
abbr -a zjd zellij delete-session
abbr -a zjda zellij delete-all-sessions

abbr -a d docker
abbr -a dc docker container ls -a
abbr -a di docker image ls -a

### PATH configuration 
# Folders of binaries that can be run from anywhere
# fish_add_path is the same as export PATH in bash

fish_add_path ~/.spicetify/
fish_add_path ~/scripts/ # Use {scriptName}.sh in shell to execute scripts
fish_add_path ~/binaries/
fish_add_path ~/.cargo/bin/ # Rust binaries
fish_add_path ~/.local/bin/ # Python's binaries, like syncedlyrics, etc
fish_add_path ~/.local/lib/python3.11/site-packages # For pip installed Python executables, like aichat-cli

### Completion configuration

# Check if kubectl is installed
if command -v kubectl >/dev/null
    kubectl completion fish | source # If kubectl is installed, load its completions
end

### Work specific abbrs

abbr -a kube-dev aws eks update-kubeconfig --name develop-kube
abbr -a kube-test aws eks update-kubeconfig --name test-kube
abbr -a kube-stage aws eks update-kubeconfig --name stage-kube
abbr -a kube-prod aws eks update-kubeconfig --name prod-kube
abbr -a kube-penny aws eks update-kubeconfig --name penny-kube

abbr -a k kubectl -n brame
abbr -a kp kubectl -n brame get pods
abbr -a kpw watch -d -n 1 kubectl -n brame get pods
