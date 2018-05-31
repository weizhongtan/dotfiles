export DEV_HOME="$HOME/development"

# Set postgres path
export PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/latest/bin:${HOME}/bin:/usr/local/bin"

# Set nvm path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Setup Go path
export GOPATH="${HOME}/go"
export PATH=$PATH:$(go env GOPATH)/bin

# Alias definitions
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

# Function definitions
if [ -f ~/.bash_functions ]; then . ~/.bash_functions; fi

# Adds colour by default to ls
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Interesting reading: https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
HISTSIZE=1000000         # history in memory
HISTFILESIZE=1000000000  # history on disk
shopt -s histappend      # save all history, not just last closed session

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# adds RSA or DSA identities to the authentication agent: ~/.ssh/id_rsa, ~/.ssh/id_dsa and ~/.ssh/identity
ssh-add

# git branch autocomplete
source ~/.git-completion.bash
__git_complete gco _git_checkout
__git_complete gb _git_branch

# show git info in branch
source ~/.git-prompt.sh

# PS1 customization
reset=$(tput sgr0)   # resets colour
y1=$(tput setaf 226) # yellow 1
y2=$(tput setaf 220) # yellow 2
y3=$(tput setaf 214) # yellow 3
b1=$(tput setaf 39)  # blue
g1=$(tput setaf 10)  # green
m1=$(tput setaf 5)   # magenta
export PS1='\[$y3\]\d\[$y2\]@\[$y1\]\t \[$y1\]\u\[$y2\]@\[$y3\]\h:\[$b1\]$(pwd)\[$g1\]$(__git_ps1 "(%s)") \n\[$m1\]$ \[$reset\]'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wzt/google-cloud-sdk/path.bash.inc' ]; then source '/Users/wzt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wzt/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/wzt/google-cloud-sdk/completion.bash.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# avn https://github.com/wbyoung/avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# Amigo stuff
if [ -f $HOME/.bash_amigo ]; then source $HOME/.bash_amigo; fi