#
export COMPOSE_REMOVE_ORPHANS=1
export PATH="/var/lib/sysb/.local/bin:$PATH"
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'	# colored GCC warnings and errors
export IP=$(ip route get 1.1.1.1 | grep -oP 'src \K\S+') MYIP=$IP PUBLICIP=$IP PUBLIC_IP=$IP
export IP2=$(curl -fs http://169.254.169.254/metadata/v1/interfaces/private/0/ipv4/address) IP0=$IP2 VPCIP=$IP2 VPC_IP=$IP2 PRIVIP=$IP2 PRIV_IP=$IP2 PRIVATE_IP=$IP2 PRIVATEIP=$IP2
#
#    RED="\e[00;31m"; LIGHT_RED="\e[01;31m";    DARK_RED="\e[02;31m"; GREEN="\e[00;32m"; BRIGHT_GREEN="\e[01;32m"; DARK_GREEN="\e[02;32m";
#  BROWN="\e[00;33m";    YELLOW="\e[01;33m"; DARK_YELLOW="\e[02;33m";  BLUE="\e[00;34m";   LIGHT_BLUE="\e[01;34m";  DARK_BLUE="\e[02;34m";
# PURPLE="\e[00;35m";   MAGENTA="\e[01;35m"; DARK_PURPLE="\e[02;35m";  CYAN="\e[00;36m";   LIGHT_CYAN="\e[01;36m";  DARK_CYAN="\e[02;36m";
#  WHITE="\e[01;37m";  OFFWHITE="\e[00;37m";  LIGHT_GRAY="\e[02;37m"; BLACK="\e[00;30m";         GRAY="\e[01;30m";  DARK_GRAY="\e[02;30m";
#   AQUA="\e[01;36m";      TEAL="\e[01;36m"; END="\e[00m"; E="\e[m";		
#       󰡨    󰆼 󰌽     󰕈       󰒃 󰒒   󰒘  󰢏 󰚊     󰌠     󰊤    󰊶   󰊭  󰒋 󰒍
# R="\e[00;31m"; LR="\e[01;31m"; BR="\e[01;31m"; DR="\e[02;31m"; G="\e[00;32m"; LG="\e[01;32m"; BG="\e[01;32m"; DG="\e[02;32m"; B="\e[00;34m"; LB="\e[01;34m"; BB="\e[01;34m"; DB="\e[02;34m"; P="\e[00;35m"; LP="\e[01;35m"; BP="\e[01;35m"; DP="\e[02;35m"; C="\e[00;36m"; LC="\e[01;36m"; BC="\e[01;36m"; DC="\e[02;36m"; Y="\e[00;33m"; LY="\e[01;33m"; BY="\e[01;33m"; DY="\e[02;33m"; K="\e[00;30m"; LK="\e[01;30m"; BK="\e[01;30m"; DK="\e[02;30m"; GR="\e[01;30m"; LGR="\e[02;37m"; BGR="\e[00;37m"; DGR="\e[02;30m"; OW="\e[00;37m"; LW="\e[00;37m"; W="\e[01;37m"; DW="\e[02;37m"; M="\e[01;35m"; E="\e[m"; END="\e[00m";
#
case $- in *i*) ;; *) return ;; esac  ## Equivalent: # [[ $- == *i* ]] || return 	## If not running interactively, don't do anything
[ -z "${HOME}" ] && { [ -d /var/lib/sysb ] || mkdir -p /var/lib/sysb; export HOME="/var/lib/sysb"; }
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  ## less to preview contents of non-text files (.tar.gz, .zip, .pdf, .png) directly as plain text instead of binary garbage
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then debian_chroot=$(cat /etc/debian_chroot); fi  ## set variable identifying the chroot you work in (used in the prompt below)
unset HISTFILE HISTSIZE=100 HISTFILESIZE=1000 HISTCONTROL=ignoreboth shopt -s histappend checkwinsize
#
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]~  \[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ' 	## PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '; fi 	## if no color_prompt ie: color_prompt=no
case "$TERM" in xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1";; *) ;; esac	# If xterm set title to user@host:dir ## Equivalent: # [[ $TERM == xterm* || $TERM == rxvt* ]] && PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#
### send notifications on ssh login
# [ -n "$SSH_CONNECTION" ] && TYPE="ssh from/via: $(echo $SSH_CONNECTION | awk '{print $1}')" || TYPE="direct session"
# (curl -s -d "$(whoami)@$(hostname):$(hostname -I | awk '{print $1}') => $TYPE" $NTFY_HOST/$NTFY_TOPIC > /dev/null 2>&1 &)
#
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#
alias cls=clear
alias pip="pip3"
alias py=python3
alias python=python3
alias where="whereis"
alias nbashrc="nano ~/.bashrc"
alias srcbashrc="source ~/.bashrc"
alias activate="source ~/.venv/bin/activate"
alias vactivate="source ~/.venv/bin/activate"
#
alias svc="sudo systemctl"
alias ceph="sudo microceph"
alias logs="sudo journalctl -n 50 -f -u"
#
alias dblogs="sudo tail -n 50 -f /var/log/postgresql/postgresql-18-main.log"
alias pglogs="sudo tail -n 50 -f /var/log/postgresql/postgresql-18-main.log"
# git
alias gc="git clone"
alias gp='git commit -m " " && git push -u origin main --tags'
# docker
alias dc="docker compose"
alias dcl="docker compose logs -f"
alias dcup="docker compose up"
alias dcupd="docker compose up -d --remove-orphans"
alias dcp="docker compose --profile"
alias docker-compose="docker compose"
# docker ps --format "{{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Status}}\t{{.Ports}}" | awk -F'\t' 'BEGIN {print "CONTAINER ID\tNAMES\tCOMMAND\tSTATUS\tPORTS"} {names=substr($2,1,20); gsub(/0.0.0.0:/, "", $5); gsub(/\/tcp/, "", $5); print $1 "\t" names "\t" $3 "\t" $4 "\t" $5}' | column -t -s $'\t'
alias dps='docker ps --format "{{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Status}}\t{{.Ports}}" | awk -F"\t" '\''BEGIN {print "CONTAINER ID\tNAMES\tCOMMAND\tSTATUS\tPORTS"} {names=substr($2,1,24); gsub(/0.0.0.0:/, "", $5); gsub(/\/tcp/, "", $5); print $1 "\t" names "\t" $3 "\t" $4 "\t" $5}'\'' | column -t -s $'\''\t'\'''
# alias dps='docker ps'  # List running Docker containers
alias ds="docker stats"
alias dsr='docker stack rm'
alias dnls="docker node ls"
alias dnps="docker node ps"
alias dlc='docker ps -l'  # List last Docker container
alias dlcid='docker ps -l -q'  # List last Docker container ID
alias dlcip='docker inspect -f "{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{end}}" $(docker ps -l -q)'  # Get IP's of last Docker container
alias dlcex='docker exec -it `dlcid` ' # Enter last container (works with Docker 1.3 and above)
alias dlcexec='docker exec -it `dlcid` ' # Enter last container (works with Docker 1.3 and above)
alias dlcbash='docker exec -it `dlcid` bash' # Enter last container (works with Docker 1.3 and above)
alias dlcsh='docker exec -it `dlcid` sh' # Enter last container (works with Docker 1.3 and above)
alias dpsa='docker ps -a'  # List all Docker containers
alias dlclogs='docker logs `dlcid` -f'
alias dsls='docker service ls'
alias dsi='docker service inspect'
alias dsu='docker service update'
alias dsl='docker service logs -f'
alias dslogs='docker service logs -f'
alias dscl='docker service scale'
alias dsrm='docker service rm'
alias di='docker images'  # List Docker images
alias drmac='docker rm $(docker ps -a -q)'  # Delete all Docker containers
alias drmlc='docker-remove-most-recent-container'  # Delete most recent (i.e., last) Docker container
alias drmui='docker images -q -f dangling=true |xargs -r docker rmi'  # Delete all untagged Docker images
alias drmall='docker-remove-stale-assets'  # Delete all untagged images and exited containers
alias drmli='docker-remove-most-recent-image'  # Delete most recent (i.e., last) Docker image
alias drmi='docker-remove-images'  # Delete images for supplied IDs or all if no IDs are passed as arguments
alias dideps='docker-image-dependencies'  # Output a graph of image dependencies using Graphiz
alias dre='docker-runtime-environment'  # List environmental variables of the supplied image ID
# alias git='docker run -v $PWD:/var/data -v /var/data/git-docker/data/.ssh:/root/.ssh funkypenguin/git-docker git' # Run git client in a container (for hosts witohut git)
#
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'
alias chmodi="sudo chattr +i"
alias chmod6="sudo chmod 600"
alias chmodr6="sudo chmod 600"
alias chmod7="sudo chmod 755"
alias chmodr7="sudo chmod 755"
alias own="sudo chown $USER:$USER"
#
# Readline configuration via .bashrc instead of .inputrc
bind 'set show-all-if-ambiguous on'
bind 'set completion-ignore-case on'
bind 'set menu-complete-display-prefix on'
bind '"\t": menu-complete' 	# Bind Tab key for cycling instead of printing static list
#
complete -f -X '!*.pdf' zathura okular evince
complete -f -X '!*.@(mp4|mkv|avi|mp3|flac)' vlc mpv
complete -W "development staging production" deploy.sh
complete -W "start stop restart status logs" service-control
complete -W "$(echo $(grep '^[Hh]ost ' ~/.ssh/config 2>/dev/null | awk '{print $2}') $(awk '{print $1}' ~/.ssh/known_hosts 2>/dev/null | cut -d, -f1))" ssh
#
command -V uv >/dev/null && [ ! -f ~/.local/share/bash-completion/completions/uv ] && mkdir -p ~/.local/share/bash-completion/completions && uv generate-shell-completion bash > ~/.local/share/bash-completion/completions/uv
command -V uvx >/dev/null && [ ! -f ~/.local/share/bash-completion/completions/uvx ] && mkdir -p ~/.local/share/bash-completion/completions && uvx --generate-shell-completion bash > ~/.local/share/bash-completion/completions/uvx
command -v docker >/dev/null && [ ! -f ~/.local/share/bash-completion/completions/docker ] && mkdir -p ~/.local/share/bash-completion/completions && docker completion bash > ~/.local/share/bash-completion/completions/docker
#
shopt -oq posix || { [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion; } || { [ -f /etc/bash_completion ] && . /etc/bash_completion; } 	## programmable completion #skip this, if already set in /etc/bash.bashrc and /etc/profile
shopt -oq posix || for f in ~/.local/share/bash-completion/completions/*; do [ -f "$f" ] && . "$f"; done  ## Loop and source all custom user completions
#
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi 	## Alias definitions # TODO: fetch aliases from cloud and set
#
_DS=/var/cfs/ds
dsd(){ docker stack deploy "$1" -c "$_DS/$1.yml";} ## dsd(){ echo -e "$1 -c $_DS/$1/$1.yml" | docker stack deploy ;}
ntfy(){ (curl -s -d "$1" $NTFY_HOST/$NTFY_TOPIC > /dev/null 2>&1 &); }	## set alias for ntfy.sh > send notifications
unalias alert 2>/dev/null
alert() { local s=$?; echo -e "\a\n[ $([ $s -eq 0 ] && echo -e "\e[32mSUCCESS\e[0m" || echo -e "\e[31mERROR\e[0m") ] Finished: $(history 1 | sed -e 's/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//')"; }
#
# TODO: custom motd summary
#
# (( $(date +%s) - $(stat -c %Y ~/.rc_sync 2>/dev/null || echo 0) > 86400 )) && _R=$(curl -LsSf --max-time 3 rc.bbl.sh 2>/dev/null) && touch ~/.rc_sync && . <(echo "${_R:-$(cat ~/.rc_fb 2>/dev/null)}") && [ -n "$_R" ] && echo "$_R" > ~/.rc_fb
#