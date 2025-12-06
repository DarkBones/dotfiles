# Show system summary for context when opening interactive shells
if [[ -o interactive ]] && command -v neofetch >/dev/null 2>&1; then
  # Prevent duplicate output if the file gets re-sourced
  if [[ -z ${ZSH_NEOFETCH_RAN:-} ]]; then
    typeset -g ZSH_NEOFETCH_RAN=1
    neofetch
  fi
fi
