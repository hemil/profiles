# Path to your oh-my-zsh installation.
export ZSH=/Users/hemilshah/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
DISrABLE_CORRECTION="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx bower pep8 rand-quote virtualenvwrapper sublime web-search)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8


# VirtualEnvWrapper aliases
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

alias console_prod='csshx --host ~/hosts/console_prod'
alias console_preprod='csshx --host ~/hosts/console_preprod'
alias console_stage='csshx --host ~/hosts/console_stage'

alias pos_prod='csshx --host ~/hosts/pos_prod'
alias pos_preprod='csshx --host ~/hosts/pos_preprod'
alias pos_stage='csshx --host ~/hosts/pos_stage'

alias rpc_prod='csshx --host ~/hosts/rpc_prod'
alias rpc_preprod='csshx --host ~/hosts/rpc_preprod'
alias rpc_stage='csshx --host ~/hosts/rpc_stage'

alias ims_prod='csshx --host ~/hosts/ims_prod'
alias ims_preprod='csshx --host ~/hosts/ims_preprod'
alias ims_stage='csshx --host ~/hosts/ims_stage'

alias reports_prod='csshx --host ~/hosts/reports_prod'
alias reports_preprod='csshx --host ~/hosts/reports_preprod'
alias reports_stage='csshx --host ~/hosts/reports_stage'

alias mysql_master='csshx --host ~/hosts/mysql_master'
alias mysql_slave='csshx --host ~/hosts/mysql_slave'


# List vpc Hosts
alias list_console='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" retail_console'
alias list_ims='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" retail_ims'
alias list_rpc='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" retail_rpc'
alias list_reports='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" retail_reports'
alias list_pos='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" retail_pos'
alias list_mysql='ansible -i ~/grofers/ansible-retail/environments/prod/ -m shell -a "hostname" "retail_mysql*"'

# functions
kill_port_process(){
kill -9 $(lsof -ti tcp:$1)
}

delete_pattern(){
echo "Deleting all files matching pattern: "$1
#find . -name '*$1*' -delete
rm *$1
echo "Deleted."
}

zipf () { zip -r "$1".zip "$1" ; }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

# Transfer files. through cloud. http://www.transfer.sh
transfer() {
  if [$# - eq 0]; then
      echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md";
      return 1;
  fi
  tmpfile = $(mktemp - t transferXXX);

  if tty - s; then
      basefile = $(basename "$1" | sed - e 's/[^a-zA-Z0-9._-]/-/g');
      curl--progress - bar--upload - file "$1" "https://transfer.sh/$basefile" >> $tmpfile;

  else
      curl--progress - bar--upload - file "-" "https://transfer.sh/$1" >> $tmpfile;
  fi;

  cat $tmpfile;
  rm - f $tmpfile;
}

alias reload="source ~/.zshrc"
alias find_process="ps ax | grep"
alias zsh="vi ~/.zshrc"
alias delete_pattern=delete_pattern
alias LogIt="/Users/hemilshah/LogIt.sh"
alias matrix1="cat /dev/random | hexdump | awk '{printf "%c", $1%74+48}'"
alias 42="cat /dev/urandom | hexdump -C | grep '42 42'"
alias weather="curl -4 http://wttr.in/Bangalore"
alias git_undo="git reset HEAD~1"
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
alias subl="open /Applications/Sublime\ Text\ 2.app"
alias p="python"
alias pin="echo 'mellon' | sudo -S pip install"
alias ydl='youtube-dl'
alias ..='cd ../'
alias .2='cd ../../'
alias .3='cd ../../..'
alias f='open -a Finder ./'
alias ~='cd ~/'
alias path='echo -e ${PATH//:/\\n}' 
alias clean_sins='find . -size  0 -print0 |xargs -0 rm'


alias serve='python -m SimpleHTTPServer'
alias vpn="sudo openconnect --cafile /Users/hemilshah/Downloads/vpn/ca-cert.pem --certificate /Users/hemilshah/Downloads/vpn/client.p12 --key-password 'nephrological-blackstraps' --pfs 52.58.128.93:4443"
alias scopy="echo 'scp your_username@remotehost.edu:foobar.txt /some/local/directory'"



# Harry Potter Aliases
alias priorIncantato='echo `history |tail -n2 |head -n1` | sed "s/[0-9]* //"'
alias imperio=sudo
alias accio=wget
alias reducio=zipf
alias engorgio=extract  # $engorgio zippedName
alias legilimens='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'  # see the hidden thoughts!
alias occlumens='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'  # keep hidden things hidden!
alias obliviate='history -c; history -w'  # clear bash history
alias nox='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'  # lock screen
alias locomotor=mv
alias reenervate='echo "You'"'"'ve initiated reboot sequence. Rebooting in 5 seconds...; sleep 5s; sudo shutdown -r now'
alias avada_kedavra=kill_port_process
alias aparecium='echo "------------Your aliases------------";alias'
alias revealo="ps ax  | grep "
alias scourgify_pyc="find . -name '*.pyc' -delete"
alias tergeo="rm "

# Get your current public IP
alias ip="curl icanhazip.com"
alias ip_local="ifconfig |grep inet|awk '{print $2}'|head -4 | tail -1"

export PATH=/usr/local/mysql/bin:$PATH
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH


