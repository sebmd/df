# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# wczytanie standardowej konfiguracji BASH
[ -f "/etc/bashrc" ] && . "/etc/bashrc"

# wczytanie zmiennych z ~/.config/vars
[ -f "$HOME/.config/vars" ] && . "$HOME/.config/vars"

# wczytanie aliasów z pliku ~/.config/aliases
[ -f "$HOME/.config/aliases" ] && source "$HOME/.config/aliases"

# wyłączenie ctrl-s i ctrl-q
stty -ctlecho

# ustawinie esc na capslocku + prędkość klawiatury
if [ $DISPLAY ]; then
    setxkbmap -option caps:escape
    xset r rate 280 40
fi

# inne opcje dla setxkbmap
# caps:none - wyłączenie
# caps:escape - dodatkowy escape
# caps:super - dodatkowy windows key
# setxkbmap -option - zresetowanie ustawień
# setxkbmap -query - sprawdzenie ustawień

# włączenie vi mode
set -o vi

# historia poleceń
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTTIMEFORMAT='%F %T'
PROMPT_COMMAND='history -a'  # zapisuje historię poleceń od razu

# zastąpienie ssh-agent przez gpg-agent
# unset SSH_AGENT_PID
# pgrep gpg-agent > /dev/null
# if [ $? == 1 ]; then
#    eval $(gpg-agent --daemon --enable-ssh-support)
#    # gpg-connect-agent /bye
# fi

eval $(gpg-agent --daemon)
GPG_TTY=$(tty)
export GPG_TTY
export GPG_ID=''

#ssh-add $HOME/.ssh/klucze/rsa-2022

# Dodanie klucza do keychain
# /usr/bin/keychain $HOME/.ssh/id_dsa
# source $HOME/.keychain/$HOSTNAME-sh

/usr/bin/keychain -q $HOME/.ssh/id_rsa
source $HOME/.keychain/$(hostname)-sh
# source $HOME/.keychain/$HOSTNAME-sh


# # W przypadku kiedy zmienna $KEYCHAIN nie istnieje lub jest pusta uruchamia agenta ssh-agent
# if [ -z $KEYCHAIN ]; then
#     echo "Uruchamiam ssh-agent"
#     export SSH_AUTH_ENV=$HOME/.ssh/ssh-agent-$HOSTNAME.env
#   export SSH_AUTH_SOCK=~/.ssh/ssh-agent-$HOSTNAME.sock
#
#   ssh-add -l 2>/dev/null >/dev/null
#   if [ $? -ge 2 ]; then
#       ssh-agent -a "$SSH_AUTH_SOCK" | tee $SSH_AUTH_ENV >/dev/null
#   fi
#
#     ssh-add $HOME/.ssh/klucze/ed25519-2022
#
# else
#     /usr/bin/keychain -q $HOME/.ssh/klucze/ed25519-2022
#     source $HOME/.keychain/$HOSTNAME-sh
# fi

# Usunięcie klucza z keychain
# keychain --clear
# keychain --clear $HOME/.ssh/id_dsa

export LANG=pl_PL.UTF-8

# [ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
# [ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
# eval "$(starship init bash)"
# eval "$(zoxide init bash)"
# source <(gopass completion bash)
# source <(vultr-cli completion bash)
# test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# To polecenie powinno być uruchamiane jako ostatnie w pliku ~/.bashrc
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
