# Aliases and functions for apt related tasks


# Aliases ###################################################################
# Some self-explanatory aliases

alias apti='sudo aptitude install'
alias aptu='sudo aptitude update'
alias aptg='sudo aptitude upgrade'
alias aptdg='sudo aptitude dist-upgrade'
alias aptc='sudo aptitude clean'
alias aptac='sudo aptitude autoclean'
alias aptr='sudo aptitude remove'
alias aptp='sudo aptitude purge'
alias apts='aptitude search'
alias aptsh='aptitude show'
alias afu='apt-file update'
alias afs='apt-file search --regexp'
alias afl='apt-file list'

alias aptigrep='dpkg -l'


# Functions #################################################################

# Prints apt history
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
apt-history () {
  case "$1" in
    install)
      zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
      ;;
    upgrade|remove)
      zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
      ;;
    rollback)
      zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
        grep "$2" -A10000000 | \
        grep "$3" -B10000000 | \
        awk '{print $4"="$5}'
      ;;
    list)
      zcat $(ls -rt /var/log/dpkg*)
      ;;
    *)
      echo "Parameters:"
      echo " install - Lists all packages that have been installed."
      echo " upgrade - Lists all packages that have been upgraded."
      echo " remove - Lists all packages that have been removed."
      echo " rollback - Lists rollback information."
      echo " list - Lists all contains of dpkg logs."
      ;;
  esac
}
