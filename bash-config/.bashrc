alias ll='ls -al'

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
if [ -f ~/.bash_PS1 ]; then
  . ~/.bash_PS1
fi

