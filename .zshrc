# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load asdf
# Load the appropriate file depending on which exists
if [ -f "$HOME/.asdf/asdf.sh" ]; then
  . "$HOME/.asdf/asdf.sh"
elif [ -f "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]; then
  . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Load aliases
. ~/.alias
. ~/.function

# Save iex history
export ERL_AFLAGS="-kernel shell_history enabled"

# Also add Go binary to PATH since VSCode cannot discover the asdf shim on its own
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Add Begin CLI tools to PATH
# For seattlejs repo
# https://begin.com/docs/getting-started/installing-the-begin-cli
export BEGIN_INSTALL="/Users/kellirockwell/.begin"
export PATH="$BEGIN_INSTALL:$PATH"

# Add Homebrew-managed PG to PATH
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Invoke fuzzy command history search with ctrl+r. ctrl+r to cycle backwards and ctrl+s to cycle forwards.

# Load Starship config + prompt
eval "$(starship init zsh)"
