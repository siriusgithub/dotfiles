plugins=(zsh-syntax-highlighting)

setopt append_history
setopt inc_append_history

export BROWSER="firefox"
export EDITOR="vim"

source ~/.zsh.sh
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion

# Suffix aliases; Open with
alias -s jpg='sxiv-rifle'

#alias rm='echo "This is not the command you are looking for."; false'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias 360='gksudo "xboxdrv --detach-kernel-driver --buttonmap 1=3,3=1,2=4,4=2,rt=start,lt=back,start=rt,back=lt --ui-buttonmap guide=KEY_LEFTSHIFT+KEY_TAB,rt=KEY_END,lt=KEY_G --detach --dbus disabled --daemon"'
alias k360='gksudo "kill -9 xboxdrv"'
alias :q='exit'
alias amb='play -c 2 -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +10'
alias ISS='mpv http://www.ustream.tv/channel/live-iss-stream'
alias balc='sh ~/scripts/bashcalc.sh'
alias cath='highlight -O ansi'
alias catl='lolcat'
alias cd..='cd ..'
alias celeryman='mpv ~/scripts/celeryman/celeryman.mp4'
alias colemak='xmodmap .Xmodmap && setxkbmap us -variant colemak -option ctrl:nocaps'
alias cofi='notify-send "COFI!  " && sleep 8m && notify-send "COFI!  " &'
alias delsym='find . -maxdepth 1 -type l -exec trash-put {} \;'
alias dir='ls --color=auto'
alias delswp='find ./ -type f -name "\.*sw[klmnop]" -delete'
alias edit='vim'
#alias f='find . |grep '
alias brutaldoom='cd .config/gzdoom && gzdoom brutalv20b.pk3 DoomMetalVol4.wad'
alias h='history|grep '
alias j='jobs -l'
alias ll='ls -la'
alias ls='ls -hF --color=auto'
alias m='ncmpcpp'
alias ma='mpc add'
alias pacmake='makepkg -fcsi'    # Make package from PKGBUILD file in current directory
alias pu="pacaur -Syu"
alias py='python'
alias r='source $(which ranger)'
alias rem='echo \!! >> ~/.histrem'
alias resetres="xrandr --output DVI-I-1 --mode 1920x1080 --rate 120"
alias rr='ranger'
alias s='s -p duckduckgo'
alias s='setopt | nobanghist && s -p duckduckgo'
alias sernix='steam steam://connect/216.131.79.171:27015'
alias ssr='simplescreenrecorder'
alias stahp='echo STAHP | toilet --gay'
alias steam-wine='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias t='task'
alias te='trash-empty'
alias tp='trash-put'
alias trc='transmission-remote-cli'
alias tron='ssh sshtron.zachlatta.com'
alias um='udiskie-umount --detach'
alias vis='vim "+set si"'
alias yt='youtube-dl $(xclip -o)'

alias fm='cd ~/music && fr mpc add && cd'
alias fv='fr mpv'

# Funk

# Upload raw text to interweb, copy URL to clipboard.
ixc() {
  if [[ -z "$1" ]]
  then
    echo 'Usage: ixc foo.bar'
  else
    cat $1 | curl -F 'f:1=<-' ix.io | xclip -selection clipboard 
  fi
}

ixx() {
  if [[ -z "$1" ]]
  then
    echo 'ix clipboard: ixc example.txt'
  else
    ix $1 | xclip -selection clipboard 
  fi
}

#fzf stuff

#fuzzy kill
fk() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}

fr() { fzf -m -x | xargs -d'\n' -r "$@" ; }

#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

#pull symlinked files into their links.
pull () {
  for f in "$@"
  do
      orig=`readlink -f "$f"`
      mv "$orig" "$f"
  done 
}
 
# Farore's Wind; mark a spot and return.
fw() {
  local st=0
  if [[ $f ]]; then
      cd "$f"; st=$?
      unset f
  else
      f=$PWD
  fi
  return "$st"
}

note () {
  # if file doesn't exist, create it
  if [[ ! -f $HOME/.notes ]]; then
      touch "$HOME/.notes"
  fi

  if ! (($#)); then
      # no arguments, print file
      cat "$HOME/.notes"
  elif [[ "$1" == "-c" ]]; then
      # clear file
      printf "%s" > "$HOME/.notes"
  else
      # add all arguments to file
      printf "%s\n" "$*" >> "$HOME/.notes"
  fi
}

#mkdir and cd into it
mkcd() {
  if [[ -z "$1" ]]
  then
    echo 'mkcd; mkdir and cd into it. Usage: mkcd <dir>'
  else
    mkdir $1; cd $1
  fi
}

#paste text
pb () {
  curl -sF "c=@${1:--}" -w "%{redirect_url}" 'https://ptpb.pw/?r=1' -o /dev/stderr | xsel -b -l /dev/null -b
}

#paste terminal recording
pbs () {
  asciinema rec /tmp/$$.json
  pbx /tmp/$$.json
}

# Easily edit .conf files
conf() {
  case $1 in
  apache)    sudo $EDITOR /etc/apache2/apache2.conf ;;
  bash)           $EDITOR ~/.bashrc ;;
  clerk)          $EDITOR ~/.config/clerk/config ;;
  compton)        $EDITOR ~/.config/compton/compton.conf ;;
  dunst)          $EDITOR ~/.config/dunst/dunstrc ;;
  i3)             $EDITOR ~/.i3/config ;;
  i3b)            $EDITOR ~/.i3blocks.conf ;;
  keynav)         $EDITOR ~/.keynavrc ;;
  mirror)         $EDITOR /etc/pacman.d/mirrorlist ;;
  mpd)            $EDITOR ~/.mpdconf ;;
  mpv)            $EDITOR ~/.config/mpv/config ;;
  mpvi)           $EDITOR ~/.config/mpv/input.conf ;;
  ncmpcpp)        $EDITOR ~/.ncmpcpp/config ;;
  pacman)         $EDITOR /etc/pacman.conf ;;
  penta)          $EDITOR ~/.pentadactylrc ;;
  php)       sudo $EDITOR /etc/php5/apache2/php.ini ;;
  qb)             $EDITOR ~/.config/qutebrowser/qutebrowser.conf ;;
  qk)             $EDITOR ~/.config/qutebrowser/keys.conf ;;
  ranger)         $EDITOR ~/.config/ranger/rc.conf ;;
  r)              $EDITOR ~/.config/ranger/rc.conf ;;
  rifle)          $EDITOR ~/.config/ranger/rifle.conf ;;
  sxhkd)          $EDITOR ~/.config/sxhkd/sxhkdrc ;;
  sxiv)           $EDITOR ~/.config/sxiv/exec/key-handler ;;
  termite)        $EDITOR ~/.config/termite/config ;;
  tmux)           $EDITOR ~/.tmux.conf ;;
  vimpc)          $EDITOR ~/.vimpcrc ;;
  vim)            $EDITOR ~/.vimrc ;;
  xinit)          $EDITOR ~/.xinitrc ;;
  xres)           $EDITOR ~/.Xresources && xrdb ~/.Xresources ;;
  zsh)            $EDITOR ~/.zshrc ;;
      *)          echo "Unknown application: $1" ;;
  esac
}    


# confirmation #
alias cp='cp -i'
alias ln='ln -i'
alias mv='mv -i'
 
# Parenting changing perms on / #
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'

# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias up='sudo pacman -Syu'
fi

# fuck
eval "$(thefuck --alias)"

# .dircolors
eval $(dircolors ~/.dircolors)

# do not delete / or prompt if deleting more than 3 files at a time #
#alias \rm='rm -I --preserve-root'

# pacman remove orphans
orphans() {
  if [[ ! -n $(pacman -Qdt) ]]; then
    echo "No orphans to remove."
  else
    sudo pacman -Rns $(pacman -Qdtq)
  fi
}

# vman - SuperMan! Open man pages with vim from the commandline:
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[01;31m") \
    LESS_TERMCAP_md=$(printf "\e[01;38;5;74m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[38;5;246m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[04;38;5;146m") \
    man "$@"
}

              
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# .dircolors
eval $(dircolors ~/.dircolors)

autoload -U colors zsh/terminfo
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{${fg[cyan]}%}[%{${fg[green]}%}%s%{${fg[cyan]}%}][%{${fg[blue]}%}%r/%S%%{${fg[cyan]}%}][%{${fg[blue]}%}%b%{${fg[yellow]}%}%m%u%c%{${fg[cyan]}%}]%{$reset_color%}"
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'
#zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/krompus/.zshrc'


setprompt() {
  # load some modules
  setopt prompt_subst


  # make some aliases for the colours: (coud use normal escap.seq's too)
  for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
    eval PR_$color='%{$fg[${(L)color}]%}'
  done
  PR_NO_COLOR="%{$terminfo[sgr0]%}"

  # Check the UID
  if [[ $UID -ge 1000 ]]; then # normal user
    eval PR_USER='${PR_BLUE}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_BLUE}%#${PR_NO_COLOR}'
  elif [[ $UID -eq 0 ]]; then # root
    eval PR_USER='${PR_RED}%n${PR_NO_COLOR}'
    eval PR_USER_OP='${PR_RED}%#${PR_NO_COLOR}'
  fi

  # Check if we are on SSH or not
  if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then 
    eval PR_HOST='${PR_YELLOW}%M${PR_NO_COLOR}' #SSH
  else 
    eval PR_HOST='${PR_BLUE}%M${PR_NO_COLOR}' # no SSH
  fi
  # set the prompt
  PS1=$'${PR_CYAN}[${PR_USER}${PR_CYAN}@${PR_HOST}${PR_CYAN}][${PR_BLUE}%~${PR_CYAN}]${PR_USER_OP} '
  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
