export EDITOR=${EDITOR:-nvim}
export VISUAL=${VISUAL:-$EDITOR}
export LANG=${LANG:-en_US.UTF-8}
export COLORTERM=${COLORTERM:-truecolor}

# Identity switches overridable per machine (E.g. via HM)
export OS_TYPE=${OS_TYPE:-$(uname | tr '[:upper:]' '[:lower:]')}
export MACHINE_ROLE=${MACHINE_ROLE:-personal} # personal / work / etc.

# Developer home
export DEV_HOME=${DEV_HOME:-"$HOME/Developer"}
export PATH="$HOME/bin:$PATH"
path=(
  $HOME/.local/state/nix/profiles/home-manager/bin
  $HOME/.nix-profile/bin
  $HOME/bin
  $path
)
export PATH

# Safe HM vars (works on NixOS + non-Nix)
_hm_session_vars_candidates=(
  "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
  "/nix/var/nix/profiles/per-user/$USER/home-manager/etc/profile.d/hm-session-vars.sh"
  "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
)

for f in "${_hm_session_vars_candidates[@]}"; do
  if [ -r "$f" ]; then
    unset __HM_SESS_VARS_SOURCED
    . "$f"
    export HM_VARS_LOADED_FROM="$f"
    break
  fi
done

unset _hm_session_vars_candidates

############################ TEMPORARY, MOVE TO PROPER PLACE

alias web-pry="docker-compose exec web bundle exec pry-remote -w"
alias sidekiq-pry="docker-compose exec sidekiq_all bundle exec pry-remote -w"
alias assign-pry="docker-compose exec sidekiq_assignments bundle exec pry-remote -w"
alias api-pry="docker-compose exec api bundle exec pry-remote -w"

alias bundle-install="docker-compose exec web bundle install && docker-compose exec sidekiq_all bundle install && docker-compose exec sidekiq_assignments bundle install"
alias export-ai="$HOME/Developer/papershift/export_ai.sh"
