() {
  setopt localoptions

  print -u2 "[secrets] entering, xtrace=$options[xtrace]"

  for var in ${(k)parameters}; do
    [[ "$var" == *_SECRET_PATH ]] || continue

    secret_path="${(P)var}"

    if [[ -n "$secret_path" && -r "$secret_path" && "$secret_path" == /run/secrets/* ]]; then
      base="${var%_SECRET_PATH}"
      print -u2 "[secrets] resolving $var -> $base from $secret_path; xtrace=$options[xtrace]"
    fi
  done
}
