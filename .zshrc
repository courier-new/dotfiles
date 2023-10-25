# Path to your oh-my-zsh installation.
export ZSH=/Users/kellirockwell/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Auto-accepts the update prompt when running bi-weekly auto-update check finds a newer version.
DISABLE_UPDATE_PROMPT=true

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

autoload -U +X bashcompinit && bashcompinit

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  npm
  asdf
  docker
  dotenv
  yarn
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# --------------------------------------------------------------------------------
# User configuration
# --------------------------------------------------------------------------------

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Load asdf
. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load aliases
if [ -f ~/.alias ]; then
  . ~/.alias
fi

# Load functions
if [ -f ~/.function ]; then
  . ~/.function
fi

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


# Set the color for ZSH auto-suggestion highlight style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# Bind tab to accept + execute for zsh-autosuggestions
bindkey '^[[Z'  complete-word           # shift + tab  | complete
bindkey '^I'    autosuggest-execute     # tab          | autosuggest

# Invoke fuzzy command history search with ctrl+r. ctrl+r to cycle backwards and ctrl+s to cycle forwards.

# Load Starship config + prompt
eval "$(starship init zsh)"
