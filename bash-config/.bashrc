alias ls="ls -G"

## Web page: https://geoff.greer.fm/lscolors/
export CLICOLOR=1
# directory: green (c)
# symlink:   red (b)
# socket: bold green (C)
# pipe: bold Brown (D)
# executable: cyan (g)
# block special:
# character special:
# executable with setuid bit set
# executable with setgid bit set
# directory writable to others with sticky bit
# directory writable to others without sticky bit
export LSCOLORS=cxbxCxDxgxegedabagaced

alias ll='ls -al'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\e[0;32m\]\u@\h \[\e[0;34m\]\W\[\e[33m\]\$(parse_git_branch) \@\$ \[\e[00m\]"

#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
if [ -f ~/.bash_PS1 ]; then
  . ~/.bash_PS1
fi
