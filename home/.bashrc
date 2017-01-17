
DEVELOPMENT=$HOME/Development
PROJECTS=$DEVELOPMENT/Projects

#python
export PYTHONSTARTUP=~/.pythonrc

#NPM
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'
NPM_PACKAGES=$HOME/.npm-packages
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
export NPM_PACKAGES_PATH=$NPM_PACKAGES/bin

#CABAL
export CABAL_PATH=$HOME/.cabal/bin

export LOCAL_PATH=$HOME/.local/bin

export EDITOR=nvim

#FZF
export FZF_DEFAULT_COMMAND="find -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"

#LEIN
export LEIN_REPL_PORT=50001

#ANDROID
#export ANDROID_HOME=$HOME/Development/vendor/android-sdk/
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.4.1_1 

#PATH setup
export PATH=$NPM_PACKAGES_PATH:$CABAL_PATH:$LOCAL_PATH:$ANDROID_HOME:$PATH

#Aliases
alias blender=~/Applications/Blender.app/Contents/MacOS/blender
alias finder=open
alias l='ls'
alias sl='ls'
alias vim=nvim
alias lisp='rlwrap sbcl'

alias gcm=_gitcommitwithbranch
alias gpo='git push origin '
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gc='git checkout'
alias gcb='git checkout -b'
alias cljslein='rlwrap lein'
alias smlr='rlwrap sml'
alias racketr='rlwrap racket'
alias schemer='rlwrap scheme'
alias prolog='swipl'
alias ctags="`brew --prefix`/bin/ctags"

function mkcd {
    mkdir "$1" && cd "$1"
}

# https://docs.nodejitsu.com/articles/HTTP/servers/how-to-create-a-HTTPS-server
# http://www.hacksparrow.com/node-js-https-ssl-certificate.html

function git-commit-with-branch {
    git commit -a -m "$(echo $(git branch | grep '*' | sed 's/* //')$(echo " ")$(echo $*))"
}

function git-clean-branches {
    git checkout master; git branch | sed -e '/master/d' -e 's/^/git branch -D /' | bash
}

function git-origin-branch {
    git fetch; git checkout -b $1 origin/$1 
}

function ipaddr {
    ifconfig | grep 'inet.*broadcast';
}

function include-if-exists () {
    [[ -f "$1" ]] && source "$1"
}

function isGit() {
    if [ -d .git ]; then
        echo True;
    else
        git rev-parse --git-dir 2> /dev/null;
    fi;
}

function search-and-replace-fn() {
    find $1 -name $2 -type f -exec sed -i '' -e $3 {} \;
}

function search-and-replace() {
    case $# in
        3) search-and-replace-fn $1 $2 $3 
            ;;
        2) search-and-replace-fn './' $1 $2
            ;;
        1) search-and-replace-fn './' '*' $1
            ;;
        *) echo "usage: search-and-replace [dir] [file] [pattern]"
            ;;
    esac
}

function port-user() {
    lsof -i tcp:$1
}

function download-images() {
    wget `lynx -image_links -dump $1 | grep '\. https\?://.*\.\(gif\|jpg\|png\)$' | cut -d . -f 2- | cut -d ' ' -f 2- `
}

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
