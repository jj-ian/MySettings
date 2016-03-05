if [ -f ~/.bashrc ]; then
       source ~/.bashrc
fi

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# alias precompile='cd /Users/juliechien/Documents/InteractAble/Code/DevelopBranch/;rake assets:precompile'

# alias na='cd /Users/juliechien/Dropbox/InteractAble/Code/InteractAble'

# alias db='cd /Users/juliechien/Dropbox/InteractAble/Code/DevelopBranch'

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias clic='ssh yc2937@clic.cs.columbia.edu'

alias c='clear'

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

script "/Users/juliechien/Documents/terminal-logs/`date`"

alias cdu='cd ..'

alias ls='ls -GpF'

# OPAM configuration
. /Users/juliechien/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
