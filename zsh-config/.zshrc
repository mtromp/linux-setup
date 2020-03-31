# autoload -Uz compinit && compinit
# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst


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

alias ls='ls -G'
alias ll='ls -al'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PROMPT="%F{green}%n@%m%f %F{blue}%1~%f%F{red}$(parse_git_branch)%f %F{yellow}%T%#%f "
