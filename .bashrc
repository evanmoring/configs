# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples



# case ${TERM} in

#     screen*)
#         echo "test"
#         # user command to change default pane title on demand
#         function title { TMUX_PANE_TITLE="$*"; }

#         # function that performs the title update (invoked as PROMPT_COMMAND)
#         function update_title { printf "\033]2;%s\033\\" "${1:-$TMUX_PANE_TITLE}"; echo $TMUX_PANE_TITLE;}

#         # default pane title is the name of the current process (i.e. 'bash')
#         TMUX_PANE_TITLE=$(ps -o comm $$ | tail -1)

#         # Reset title to the default before displaying the command prompt
#         PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'update_title'   

#         # Update title before executing a command: set it to the command
#         trap 'update_title "$BASH_COMMAND"' DEBUG

#         ;;


# esac


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

source ~/peanut_ws/devel/setup.bash

# make less more friendly for non-text input files, see lesspipe(1)

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# let you know if you are in a docker container
if [ -f /.dockerenv ]; then
	PS1="$PS1 \033[0;31m<docker>\033[0m"
fi

# show the current git branch
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
};

PS1="$PS1\033[0;33m\$(parse_git_branch)\033[0m"

# adds SSH robot to PS1
PS1="$PS1 \033[01;32m\$SSH_ROBOT\033[0m\n\$ "
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#source /opt/ros/noetic/setup.bash
source ~/.bashrc_evan
[ ! -x ~/peanut_ws/setup.bash ] || WORKSPACE=~/peanut_ws source ~/peanut_ws/setup.bash
export TERM=xterm

export XAUTHORITY=$HOME/.Xauthority

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'

source ~/.evan_rc
export PEANUT_CONFIG='robot2'
[ ! -x ~/peanut_docker/setup.bash ] || WORKSPACE=~/peanut_docker source ~/peanut_docker/setup.bash

source ~/peanut_ws/bin/operator_tools/operator_tools.sh

export REMOTE_WS=~/sshfs/home/peanut/peanut_ws

alias mount_nuc="sudo sshfs -o allow_other,default_permissions,IdentityFile=~/.ssh/nuc peanut@${SSH_ROBOT}:/ ~/sshfs"

alias file-explorer="nautilus --browser"

