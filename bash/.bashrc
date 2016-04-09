#-----------------
# krompus ~/.bashrc 
#-----------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1
# Default [krompus@creator ~]
PS1='\[\e[1;29m\][\u@\h \W]\$\[\e[0m\] '

source ~/.alias
source ~/.func

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
     CBR="3000k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="fast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="live_79128495_JEiftPYCTpxw0TbH6tTS7kgk7TmZUE" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
     SERVER="live-jfk" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list
     
     ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0 -f alsa -i pulse -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
 }

# fuck
eval "$(thefuck --alias)"

# .dircolors
eval $(dircolors ~/.dircolors)

# gruvbox 256 colours
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# export settings
export CHEATCOLORS=true
export RANGER_LOAD_DEFAULT_RC FALSE
export EDITOR='vim'
export HISTFILESIZE=
export HISTSIZE=
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

# Disable <C-s> freeze output
#"stty -ixon

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
