# Resolve SOME_SECRET_SECRET_PATH variables into SOME_SECRET (actual secret values)
for var in ${(k)parameters}; do
  # Only variables ending with _SECRET_PATH
  [[ "$var" == *_SECRET_PATH ]] || continue

  secret_path="${(P)var}"

  if [[ -n "$secret_path" && -r "$secret_path" && "$secret_path" == /run/secrets/* ]]; then
    base="${var%_SECRET_PATH}"
    value="$(<"$secret_path")"
    export "$base=$value"
  fi
done
