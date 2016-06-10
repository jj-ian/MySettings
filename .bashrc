
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=10
    # Indicate that there has been dir truncation
    local trunc_symbol="..."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]' 
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color
    
    # regular colors
    local K="\[\033[0;30m\]"    # black
    local R="\[\033[0;31m\]"    # red
    local G="\[\033[0;32m\]"    # green
    local Y="\[\033[0;33m\]"    # yellow
    local B="\[\033[0;34m\]"    # blue
    local M="\[\033[0;35m\]"    # magenta
    local C="\[\033[0;36m\]"    # cyan
    local W="\[\033[0;37m\]"    # white
    
    # emphasized (bolded) colors
    local EMK="\[\033[1;30m\]"
    local EMR="\[\033[1;31m\]"
    local EMG="\[\033[1;32m\]"
    local EMY="\[\033[1;33m\]"
    local EMB="\[\033[1;34m\]"
    local EMM="\[\033[1;35m\]"
    local EMC="\[\033[1;36m\]"
    local EMW="\[\033[1;37m\]"
    
    # background colors
    local BGK="\[\033[40m\]"
    local BGR="\[\033[41m\]"
    local BGG="\[\033[42m\]"
    local BGY="\[\033[43m\]"
    local BGB="\[\033[44m\]"
    local BGM="\[\033[45m\]"
    local BGC="\[\033[46m\]"
    local BGW="\[\033[47m\]"
    
    local UC=$EMK                 # user's color
    [ $UID -eq "0" ] && UC=$R   # root's color
    
   # PS1="$TITLEBAR${EMK}${UC}\u${EMK}@${UC}\h ${EMB}\${NEW_PWD}${EMK}${UC}\\$ ${NONE}"
    PS1="$TITLEBAR${EMK}${UC}\u${EMK} ${EMB}\${NEW_PWD}${EMK}${UC}\\$ ${NONE}"
    # without colors: PS1="[\u@\h \${NEW_PWD}]\\$ "
    # extra backslash in front of \$ to make bash colorize the prompt
}

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt

####### INTERACTABLE
alias na='cd /Users/juliechien/Documents/InteractAble/Code/InteractAble'
alias db='cd /Users/juliechien/Documents/InteractAble/Code/DevelopBranch'
alias precompile='cd /Users/juliechien/Documents/InteractAble/Code/DevelopBranch/;rake assets:precompile'
alias nsqb='open -n /Applications/sqlitebrowser.app'
alias ia='ssh interactable@dev-game.interactable.org'

####### ETSY
alias sync='fswatch -e target . | xargs -n1 ~/etsync.sh'
alias evm='mosh ychien@ychien.vms.etsy.com'
####### SCHOOL
alias os='ssh -p 3022 archie@127.0.0.1'
alias plt='ssh -p 3023 julie@127.0.0.1'
alias clic='ssh yc2937@clic.cs.columbia.edu'
alias algo='cd /Users/juliechien/Dropbox/Julie/Columbia/CSOR4231\ \(Analysis\ of\ Algorithms\ I\)/Yannakakis\ HW/'
alias ocaml='rlwrap ocaml'
alias tbag='cd /Users/juliechien/Dropbox/Julie/Columbia/COMS4115\ \(Programming\ Languages\ and\ Translators\)/tbag'
alias seas='cd /Users/juliechien/Dropbox/Julie/Columbia/'

####### GENERAL
alias ls='ls -G'
alias c='clear'
alias cdu='cd ..;ls'
alias ll='ls -GalF'
alias settings='/Users/juliechien/Dropbox/Julie/Developer/MySettings'
alias tarup='tar -cvzf'
alias untar='tar -xzvf'

####### GENERAL - Ubuntu
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

killscreens () {
    screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill
}

# cd into a directory and then ls it
cs() {
    dir=$1
    if [[ -z "$dir" ]]; then
        dir=$HOME
    fi
    if [[ -d "$dir" ]]; then
        cd "$dir"
        ls
    else
        echo "bash: cs: '$dir': Directory not found"
    fi
}


cdlab() {
cd /Users/juliechien/Documents/Columbia/COMS3157/Labs/lab$1/part$2

#  cd ~/cs3157/lab$1/part$2
 }


#ulimit -u 1024
