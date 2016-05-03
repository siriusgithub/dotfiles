plugins=(zsh-syntax-highlighting)

bindkey -e
stty -ixon
setopt append_history
setopt inc_append_history
setopt noflowcontrol

export BROWSER="firefox"
export EDITOR="vim"
export RANGER_LOAD_DEFAULT_RC FALSE
export FZF_COMPLETION_TRIGGER=''
bindkey '^T' fzf-completion

PATH=$PATH:~/bin
export PATH

source ~/.zsh.sh
source ~/.alias

#zle -N copyx; copyx() { echo -E - $BUFFER | xclip -i }; bindkey '^K' copyx
zle -N copyx; copyx() { echo -E $BUFFER | xsel -ib }; bindkey '^X' copyx
alias curl='noglob curl'

#FZF_DEFAULT_OPTS='
#  --color hl:177,fg+:12,hl+:207
#  --color info:36,spinner:107,pointer:197,marker:149
#'

# Suffix aliases; Open with
alias -s jpg='sxiv-rifle'
alias -s jpeg='sxiv-rifle'
alias -s png='sxiv-rifle'
alias -s gif='mpv --loop=8'
alias -s webm='mpv --loop=8'
alias -s avi='mpv'
alias -s mp4='mpv'

eval "$(thefuck --alias)"
eval $(dircolors ~/.dircolors)

alias \rm='rm -I --preserve-root'

              
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
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
  PS1=$'${PR_YELLOW}[${PR_USER}${PR_BLUE}@${PR_HOST}${PR_YELLOW}][${PR_BLUE}%~${PR_YELLOW}]${PR_USER_OP} '
  PS2=$'%_>'
  RPROMPT=$'${vcs_info_msg_0_}'
}
setprompt

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
