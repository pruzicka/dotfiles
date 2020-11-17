#!/bin/zsh

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt HIST_SAVE_NO_DUPS 
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# z.sh -> https://github.com/rupa/z
. ~/code/z/z.sh

# completion
autoload -U compinit && compinit
autoload -Uz vcs_info

# terminal directory
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Tell the terminal about the working directory whenever it changes.
if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then

    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL, including
        # the host name to disambiguate local vs. remote paths.

        # Percent-encode the pathname.
        local URL_PATH=''
        {
            # Use LC_CTYPE=C to process text byte-by-byte.
            local i ch hexch LC_CTYPE=C
            for ((i = 1; i <= ${#PWD}; ++i)); do
                ch="$PWD[i]"
                if [[ "$ch" =~ [/._~A-Za-z0-9-] ]]; then
                    URL_PATH+="$ch"
                else
                    hexch=$(printf "%02X" "'$ch")
                    URL_PATH+="%$hexch"
                fi
            done
        }

        local PWD_URL="file://$HOST$URL_PATH"
        #echo "$PWD_URL"        # testing
        printf '\e]7;%s\a' "$PWD_URL"
    }

    # Register the function so it is called whenever the working
    # directory changes.
    autoload add-zsh-hook
    add-zsh-hook chpwd update_terminal_cwd

    # Tell the terminal about the initial directory.
    update_terminal_cwd
fi


zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git
precmd () {
    if [[ -z $(git ls-files --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{yellow}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}●%F{yellow}]'
    }
 
    vcs_info
}
 
setopt prompt_subst
PS1='%F{yellow}%c${vcs_info_msg_0_}%F{yellow} %(?/%F{blue}/%F{red})%% %{$reset_color%}'

RPS1="%{%F{white}%}[%~] %{$reset_color%}%F{green}"

alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias dev='cd ~/Documents/Development'
alias lsd 'ls -l | grep ^d'
alias mcd='mkdir $1 && cd $1'
# alias gph='git add . -A && git commit -m "$1" && git push heroku master'
alias gh='git push heroku master && heroku run rake db:migrate && heroku run rails runner -e production Rails.cache.clear'
alias fs='foreman start'
alias rt='tail -f log/development.log'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
alias beg='bundle exec guard'
alias gac="git add . -A && git commit -m 'cleanup'"
alias gdp="grunt deploy && git push"
alias pa="ping -c 5 8.8.8.8"
alias pn="ping -c 5 www.seznam.cz"
alias htail="heroku logs --tail"

path=(/usr/local/bin /usr/local/opt/rbenv/bin  $path )
path+=( /Applications/Postgres93.app/Contents/MacOS/bin ~/bin ~/local/bin )
eval "$(rbenv init -)"

# $PATH="$PATH:$HOME/bin:/Applications/Postgres93.app/Contents/MacOS/bin:$HOME/local/bin"
# export PATH="/usr/local/opt/rbenv/shims:/usr/local/opt/rbenv/bin:$PATH"

export EDITOR='subl'

eval "$(direnv hook zsh)"
