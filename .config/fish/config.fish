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

#alias t='tmux'
#alias tls='tmux ls'
#alias ta='tmux attach'
#alias td='tmux detach'
#alias tks='tmux kill-server'

alias deb='sudo deb-get'
alias sizes='gdu'
alias ffmpeg='ffmpeg -hide_banner'
alias f='ffmpeg -hide_banner'
alias mc='cd ~/Games/ && java -jar TLauncher.jar && exit'
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash' # <3
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
alias dotdesktops='/home/stankovictab/scripts/dotdesktops.sh'
alias rg='rg --no-ignore --hidden' # Includes hidden and git-ignored files
alias typeracer='toipe'
alias shortcuts='nvim ~/.dotfiles/README.md'
alias fonts='cd /usr/share/fonts/'
alias nf='neofetch'
alias rx='rxfetch'
alias nsx='nsxiv-rifle'
alias nvimclean='nvim -u NONE'
alias sound='pavucontrol-qt'
alias mediainfo='mediainfo --ParseSpeed=1' # --ParseSpeed=1 makes it so you can always see Stream Size, for some reason???
alias music='~/Apps/musikcube/musikcube'

alias upscale='~/Desktop/upscaler/upscale.sh'
alias s='~/Apps/spotify_player'
alias sd='cd ~/Desktop/StableDiffusion/stable-diffusion-webui/ && bash webui.sh' # Needs to be a cd because if not, it'll clone the whole repo inside the already cloned repo and make a mess
alias vesktop='setsid flatpak run dev.vencord.Vesktop --disable-gpu'

alias jellyfin-start='bash ~/scripts/jellyfin-start.sh'
alias jellyfin-stop='bash ~/scripts/jellyfin-stop.sh'
alias librechat-start='bash ~/scripts/librechat-start.sh'
alias librechat-stop='bash ~/scripts/librechat-stop.sh'

alias update='bash ~/scripts/update-manual.sh'

alias upf='bash ~/scripts/upf.sh'
alias lpf='bash ~/scripts/lpf.sh'

alias neovide='neovide.appimage'

alias ai='~/scripts/askai.sh'

# fd is a faster alternative to find
# Ubuntu - sudo apt install fd-find, Fedora - sudo dnf install fd-find, Arch - sudo pacman -S fd
if command -v fd >/dev/null
    alias fd='fd --hidden'
else if command -v fd-find >/dev/null
    alias fd='fdfind --hidden'
end

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
abbr -a gcp git cherry-pick
abbr -a gb git branch
abbr -a gS git stash
abbr -a gSP git stash pop

# && doesn't work well with abbr, so quotes are needed
abbr -a fav1 'time f -i in.mkv -c:v libaom-av1 -crf 40 -cpu-used 8 -c:a copy out-aomav1crf40cpu8.mkv && notify-send -u critical "FFmpeg" "Your FFmpeg job is complete!"'
abbr -a f264 'time f -i in.mkv -c:v libx264 -preset medium -crf 30 -c:a aac out-x264crf30med.mkv && notify-send -u critical "FFmpeg" "Your FFmpeg job is complete!"'
abbr -a f265 'time f -i in.mkv -c:v libx265 -preset medium -crf 30 -c:a copy out-x265crf30med.mkv && notify-send -u critical "FFmpeg" "Your FFmpeg job is complete!"'

abbr -a fm4a f -i in.mkv -vn -c:a aac out-aac.m4a # -vn is for no video, -c:v none doesn't exist
abbr -a faac f -i in.mkv -vn -c:a aac out-aac.m4a # -vn is for no video, -c:v none doesn't exist

abbr -a favif f -i in.png -c:v libaom-av1 -crf 25 -cpu-used 8 out-crf25cpu8.avif
abbr -a fwebp f -i in.png -c:v libwebp -quality 88 -compression_level 6 out-q88cl6.webp
abbr -a fjxl f -i in.png -c:v libjxl -effort 7 -distance 1 out-eff7dist1.jxl
abbr -a fjpg f -i in.png out.jpg
abbr -a fpng f -i in.jpg out.png

abbr -a zj zellij
abbr -a zjls zellij ls
abbr -a zja zellij attach
abbr -a zjk zellij kill-session
abbr -a zjka zellij kill-all-sessions
abbr -a zjd zellij delete-session
abbr -a zjda zellij delete-all-sessions

abbr -a d lazydocker
abbr -a dc docker container ls -a
abbr -a di docker image ls -a

abbr -a t tailscale

abbr -a kdewhereyouat setsid plasmashell --replace # Will run as a background process, so setsid is needed
# Old X11 Aliases for Restarting KDE Related Services
# alias kwinwhereyouat='setsid kwin_x11 --replace &' # Restarts KWin
# alias plasmawhereyouat='kquitapp5 plasmashell && kstart5 plasmashell' # Restarts Plasma

# Gear Lever supports CLI execution as of version 3.0.0, you can use --help, --integrate, --update, --list-installed, etc
abbr -a gearlever flatpak run it.mijorus.gearlever

### PATH configuration
# Folders of binaries that can be run from anywhere
# fish_add_path is the same as export PATH concatenation in bash

fish_add_path /opt/nvim/bin # NeoVim
fish_add_path ~/.spicetify/
fish_add_path ~/scripts/ # Use {scriptName}.sh in shell to execute scripts
fish_add_path ~/binaries/ # Binaries from dotfiles
fish_add_path ~/.cargo/bin/ # Rust binaries
fish_add_path ~/.local/bin/ # Python's binaries, like syncedlyrics, etc
fish_add_path ~/.local/lib/python3.11/site-packages # For pip installed Python executables
fish_add_path ~/AppImages/ # Gear Lever allows for CLI execution of AppImages

### k8s specific abbrs
# You can also use a GUI like Lens

abbr -a k-shortcuts "cat ~/.config/fish/config.fish | grep 'kubectl -n brame'" # Abbr to print out all kubectl related abbrs

abbr -a k-dev aws eks update-kubeconfig --name develop-kube
abbr -a k-test aws eks update-kubeconfig --name test-kube
abbr -a k-prod aws eks update-kubeconfig --name production-kube
abbr -a k-penny aws eks update-kubeconfig --name penny-kube

abbr -a k kubectl -n brame
abbr -a kp kubectl -n brame get pods
abbr -a kl kubectl -n brame logs -f # add pod name
abbr -a kdp kubectl -n brame describe pod # add pod name, tabbable
abbr -a kdn kubectl -n brame describe node # add node name, tabbable
abbr -a wkp watch -d -n 1 \"kubectl -n brame get pods\" # greppable
abbr -a wkt watch -d -n 1 \"kubectl -n brame top pods\" # greppable
abbr -a wktn watch -d -n 1 \"kubectl -n brame top nodes\" # greppable
# TODO: There's also the `-o wide` argument that can be used somewhere

### Completion configuration

if command -v kubectl >/dev/null # Check if kubectl is installed
    kubectl completion fish | source # If kubectl is installed, load its completions
end

# pnpm
set -gx PNPM_HOME "/home/stankovictab/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# yazi wrapper to cd after quit, from their quick start guide
# Note that you need to run it with y for it to work
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
