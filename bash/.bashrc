###
### .bashrc - written by cap deploy:cold
###

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#Default newly created files to 644 and directories to 755
umask 022

#Colors
export color_none='\e[0m'
export color_white='\e[1;37m'
export color_black='\e[0;30m'
export color_blue='\e[0;34m'
export color_light_blue='\e[1;34m'
export color_green='\e[0;32m'
export color_light_green='\e[1;32m'
export color_cyan='\e[0;36m'
export color_light_cyan='\e[1;36m'
export color_red="\e[0;31m"
export color_light_red='\e[1;31m'
export color_purple='\e[0;35m'
export color_light_purple='\e[1;35m'
export color_brown='\e[0;33m'
export color_yellow='\e[1;33m'
export color_gray='\e[0;90m'
export color_light_gray='\e[0;37m'

#Prompt
color_ps1=$color_green
#git_piece='$(__git_ps1 " \[$color_red\]%s\[$color_none\]")'
date_piece="\[${color_gray}\]\$(date '+%a %H:%M:%S')\[${color_none}\]"
export PS1="${date_piece} \u\[${color_ps1}\]@\[${color_none}\]\h \[${color_gray}\]\w\[${git_piece}\]\n\[${color_ps1}\]\$\[${color_none}\] "

#Completion
[ -f /etc/bash_completion ] && . /etc/bash_completion

#Readline
set -o emacs

#Aliases to display colors when listing files
if [ "$TERM" != "dumb" ]; then
   color='--color=auto'
   alias ls='ls $color'
   alias la='ls -a $color'
   alias lal='ls -lha $color'
   alias l='ls $color'
   alias ll='ls -lh $color'
   alias lt='ls -lhtr $color'
fi

alias du='du -k --max-depth=1'
alias df='df -h'
alias less='less -R'

alias emacs="emacs -nw"
alias e=emacs
alias profileme="history |awk '{print \$2}' |awk 'BEGIN{FS=\"|\"{print \$1}' |sort |uniq -c |sort -nr |head -n 20"

export HISTSIZE=1000000
export VISUAL=emacs
export EDITOR=emacs

bind "set show-all-if-ambiguous On"

#ENVIRONMENT VARS

#Add sbin directories to PATH (they aren't there by default)
export PATH=$PATH:/usr/sbin:/sbin

#Add service user's 'bin' directory to PATH
export PATH=$HOME/bin:$PATH

#Base path of Tomcat
export CATALINA_HOME=$HOME/tomcat

#Base path of Ant
export ANT_HOME=$HOME/ant

#Base path of JAVA JDK and JRE
export JAVA_HOME=$HOME/java
export JRE_HOME=$HOME/java/jdk/jre

#Gives Tomcat access to Java SSL Libraries
export JSSE_HOME=$JRE_HOME/lib

#Ensures Tomcat and DSpace have enough memory and use UTF-8
export CATALINA_OPTS="-server -Xms512M -Xmx1024M -Dfile.encoding=UTF-8"

export JAVA_OPTS="-Dhttps.protocols=SSLv3"

#Add Tomcat, Ant and Java 'bin' directories to PATH
export PATH=$JRE_HOME/bin:$JAVA_HOME/bin:$ANT_HOME/bin:$CATALINA_HOME/bin:$PATH

#Add Maven 'bin' directory to PATH
export MAVEN_HOME=$HOME/maven
export PATH=$MAVEN_HOME/bin:$PATH

#Give Maven more memory to work with and use UTF-8
export MAVEN_OPTS="-Xms256M -Xmx512M -Dfile.encoding=UTF-8"

#Add Environment Variables for PostgreSQL (managed by CITES SMG)
export PGDATA=$HOME/pgsql/databases
export PGHOST=$HOME/pgsql/run

#Base path of DSpace (and add to system PATH)
export DSPACE_HOME=$HOME/dspace
export PATH=$DSPACE_HOME/bin:$PATH

#Add ClamAV to the PATH
export CLAMAV_HOME=$HOME/clamav
export PATH=$CLAMAV_HOME/bin:$CLAMAV_HOME/sbin:$PATH

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 
