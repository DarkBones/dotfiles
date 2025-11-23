autoload -U colors && colors

prompt_git_branch() {
  git rev-parse --abbrev-ref HEAD 2>/dev/null | sed 's/^/- /'
}

PROMPT=$'%{$fg[cyan]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%} $(prompt_git_branch)\n$ '

RPROMPT='%{$fg[red]%}%?%{$reset_color%}'
