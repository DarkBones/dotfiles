# If there is no /run/secrets directory, do nothing.
[[ -d /run/secrets ]] || return 0

() {
  setopt localoptions noxtrace

  local var secret_path base _secret_value

  for var in ${(k)parameters}; do
    # Only variables ending with _SECRET_PATH
    [[ $var == *_SECRET_PATH ]] || continue

    # Get the path from the variable name
    secret_path=${(P)var}

    # Only accept readable paths under /run/secrets
    [[ -n $secret_path && -r $secret_path && $secret_path == /run/secrets/* ]] || continue

    base=${var%_SECRET_PATH}
    _secret_value=$(<"$secret_path")
    export "$base=$_secret_value"
  done
}
