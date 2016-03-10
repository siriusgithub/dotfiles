#-----------------
# ~/.bashrc 
#-----------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
# Default [krompus@creator ~]
#PS1='[\u@\h \W]\$ '  # Default
PS1='\[\e[1;29m\][\u@\h \W]\$\[\e[0m\] '
#PS1='[\u@\h \W]\$ '
# Green
#PS1='[\u@\h \W]\$ '  # Default
#PS1='\[\e[1;29m\][\u@\h \W]\$\[\e[0m\] '

# alias rm='echo "This is not the command you are looking for"; false'
alias ....='cd ../../../'
alias ...='cd ../../'
alias ..='cd ..'
alias 360='sudo xboxdrv --detach-kernel-driver --buttonmap 1=3,3=1,2=4,4=2,rt=start,lt=back,start=rt,back=lt --ui-buttonmap guide=KEY_LEFTSHIFT+KEY_TAB,rt=KEY_END,lt=KEY_G --detach --dbus disabled --daemon'
alias :q='exit'
alias ISS='mpv http://www.ustream.tv/channel/live-iss-stream'
alias balc='sh ~/scripts/bashcalc.sh'
alias cath='highlight -O ansi'
alias catl='lolcat'
alias cd..='cd ..'
alias celeryman='mpv ~/scripts/celeryman/celeryman.mp4'
alias colemak='xmodmap .Xmodmap && setxkbmap us -variant colemak -option ctrl:nocaps'
alias cofi='sleep 8m && notify-send "COFI!  " &'
alias delsym='find . -maxdepth 1 -type l -exec trash-put {} \;'
alias dir='ls --color=auto'
alias delswp='find ./ -type f -name "\.*sw[klmnop]" -delete'
alias edit='vim'
alias f='find . |grep '
alias brutaldoom='cd .config/gzdoom && gzdoom brutalv20b.pk3 DoomMetalVol4.wad'
alias h='history|grep '
alias j='jobs -l'
alias ll='ls -la'
alias ls='ls -hF --color=auto'
alias m='ncmpcpp'
alias pacmake='makepkg -fcsi'         # Make package from PKGBUILD file in current directory
alias py='python'
alias r='source $(which ranger)'
alias rr='ranger'
alias s='s -p duckduckgo'
# zsh seach
#alias s='setopt | nobanghist && s -p duckduckgo'
alias sernix='steam steam://connect/216.131.79.171:27015'
alias stahp='echo STAHP | toilet --gay'
alias steam-wine='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe >/dev/null 2>&1 &'
alias t='task'
alias um='udiskie-umount --detach'
alias vis='vim "+set si"'
alias yt='youtube-dl $(xclip -o)'

mkcd() {
  if [[ -z "$1" ]]
  then
    echo 'Usage: mkcd <dir>'
  else
    mkdir $1; cd $1
  fi
}


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

complete -o default -o nospace -F _man vman

# streaming
#streaming() {
#     INRES="1920x1080" # input resolution
#     OUTRES="1920x1080" # output resolution
#     FPS="30" # target FPS
#     GOP="60" # i-frame interval, should be double of FPS, 
#     GOPMIN="30" # min i-frame interval, should be equal to fps, 
#     THREADS="2" # max 6
#     CBR="2000k" # constant bitrate (should be between 1000k - 3000k)
#     QUALITY="ultrafast"  # one of the many FFMPEG preset
#     AUDIO_RATE="44100"
#     STREAM_KEY="live_79128495_JEiftPYCTpxw0TbH6tTS7kgk7TmZUE" # replace this stream key with $1 to use the terminal command `streaming streamkeyhere` to stream your video to twitch or justin
#     SERVER="live-jfk" # twitch server in New York, see http://bashtech.net/twitch/ingest.php for list
#     
#     ffmpeg -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | awk '/geometry/ {print $2}') -i :0.0 -vcodec libx264 -threads 0 /tmp/output.mkv
#    }
    
streaming() {
     INRES="1920x1080" # input resolution
     OUTRES="1920x1080" # output resolution
     FPS="15" # target FPS
     GOP="30" # i-frame interval, should be double of FPS, 
     GOPMIN="15" # min i-frame interval, should be equal to fps, 
     THREADS="6" # max 6
     CBR="2000k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="fast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="live_79128495_JEiftPYCTpxw0TbH6tTS7kgk7TmZUE" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     SERVER="live-jfk" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list
     
     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }

#       ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -f flv -ac 2 -ar $AUDIO_RATE \
#       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
#       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
#       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 
#ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s $(xwininfo -root | awk '/geometry/ {print $2}') -i :0.0 -vcodec libx264 -threads 0 /tmp/output.mkv
#    ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
#      -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
#      -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
#      -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
#} 

# Easily edit .conf files
conf() {
    case $1 in
    apache)    sudo $EDITOR /etc/apache2/apache2.conf ;;
    bash)      $EDITOR ~/.bashrc ;;
    compton)   $EDITOR ~/.config/compton/compton.conf ;;
    i3)        $EDITOR ~/.i3/config ;;
    i3b)       $EDITOR ~/.i3blocks.conf ;;
    keynav)    $EDITOR ~/.keynavrc ;;
    mpd)       $EDITOR ~/.mpdconf ;;
    mpv)       $EDITOR ~/.mpv/config ;;
    ncmpcpp)   $EDITOR ~/.ncmpcpp/config ;;
    penta)     $EDITOR ~/.pentadactylrc ;;
    php)       sudo $EDITOR /etc/php5/apache2/php.ini ;;
    ranger)    $EDITOR ~/.config/ranger/rc.conf ;;
    sxhkd)     $EDITOR ~/.config/sxhkd/sxhkdrc ;;
    termite)   $EDITOR ~/.config/termite/config ;;
    tmux)      $EDITOR ~/.tmux.conf ;;
    vimpc)     $EDITOR ~/.vimpcrc ;;
    vim)       $EDITOR ~/.vimrc ;;
    xinit)     $EDITOR ~/.xinitrc ;;
    xres)      $EDITOR ~/.Xresources && xrdb ~/.Xresources ;;
    zshrc)     $EDITOR ~/.zshrc ;;
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

# yaourt update/upgrade
alias ya='yaourt -Syua --noconfirm'
alias yaf='yaourt -Syyuua --noconfirm'
alias yac='yaourt -Syua'


# if user is not root, pass all commands via sudo #
if [ $UID -ne 0 ]; then
    alias reboot='sudo reboot'
    alias up='sudo pacman -Syu'
fi

# fuck
eval "$(thefuck --alias)"

# .dircolors
eval $(dircolors ~/.dircolors)

# gruvbox 256 colours
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# export settings
export RANGER_LOAD_DEFAULT_RC FALSE
export EDITOR='vim'
export HISTFILESIZE=
export HISTSIZE=

# Disable <C-s> freeze output
#"stty -ixon

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
