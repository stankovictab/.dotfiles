# Simple .bashrc that I got from some dude because I can't be bothered to configure bash
# https://gist.github.com/n8henrie/42f5e3be30f432e684ea8162e8a5fa60
#
#
# ~/.bashrc: executed by bash(1) for non-login shells.

# Reset path (or else it gets longer each time this is sourced)
export PATH=$(getconf PATH)

# http://unix.stackexchange.com/questions/40678/can-i-make-there-are-stopped-jobs-harder-to-kill
prompt_command() {
    job_count=$(jobs | wc -l | tr -d ' ')
    if [ $job_count -gt 0 ] ; then
        prompt_job="[$job_count]"
    else
        prompt_job=""
    fi
}
PROMPT_COMMAND=prompt_command

### HISTORY settings
# Don't need `export` in front of them
# https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history

# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# Setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# Setting to empty is unlimited
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
HISTSIZE=
HISTFILESIZE=
HISTTIMEFORMAT="%Y-%m-%d %H:%M.%S | "

shopt -s histappend cmdhist lithist histreedit histverify globstar direxpand \
  cdspell checkwinsize dotglob extglob

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
   xterm-color) color_prompt=yes;;
esac

# Uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

term_colors() {
  local BLACK="\[\033[0;30m\]"
  local BLUE="\[\033[0;34m\]"
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local RED="\[\033[0;31m\]"
  local PURPLE="\[\033[0;35m\]"
  local BROWN="\[\033[0;33m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local DARK_GRAY="\[\033[1;30m\]"
  local LIGHT_BLUE="\[\033[1;34m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local LIGHT_PURPLE="\[\033[1;35m\]"
  local YELLOW="\[\033[1;33m\]"
  local WHITE="\[\033[1;37m\]"
  local NO_COLOR="\[\033[0m\]"
  PS1="${debian_chroot:+($debian_chroot)}$LIGHT_GREEN\u@\h$NO_COLOR:$LIGHT_BLUE\w $RED\${prompt_job}$NO_COLOR\$ "
  PS1="$LIGHT_GREEN\u@\h$NO_COLOR:$LIGHT_BLUE\w $RED\${prompt_job}$NO_COLOR\$ "
}

if [ "$color_prompt" = yes ]; then
  term_colors
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\ \${prompt_job}\$ "
fi
unset color_prompt force_color_prompt

# Set LS_COLORS envvar for use with `ls --color`
for dircolor_path in /usr/bin/dircolors /usr/local/opt/coreutils/libexec/gnubin/dircolors; do
  if [ -x $dircolor_path ]; then
      test -r ~/.dircolors && eval "$($dircolor_path -b ~/.dircolors)" || eval "$($dircolor_path -b)"
  fi
done

# Fix adding quotes around names with spaces
# https://unix.stackexchange.com/questions/258679/why-is-ls-suddenly-wrapping-items-with-spaces-in-single-quotes
export QUOTING_STYLE=literal

# Alias definitions.
[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    source /etc/bash_completion
fi

# Set default editor and visual editor
export EDITOR=$(basename $(command -v nvim || command -v vim))
export VISUAL=${EDITOR}

export LC_ALL=$LANG

export GPG_TTY=$(tty)

# Default options for less (see: man less)
export LESS="--ignore-case --RAW-CONTROL-CHARS"

# Add path for GO
export GOPATH="$HOME"/go
export PATH="${GOPATH//://bin:}/bin":"${PATH}"

# pyenv stuff https://github.com/yyuu/pyenv
# Keep near end
for pyenv_path in /usr/local/var/pyenv /opt/pyenv; do
    if [[ -d $pyenv_path ]]; then
        export PYENV_ROOT=$pyenv_path
        export PATH="$PYENV_ROOT/bin:$PATH"
        eval "$(pyenv init -)";
        break
    fi
done
