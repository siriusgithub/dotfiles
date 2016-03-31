# My defaults for FZF (mostly changed to see hidden files)
export FZF_DEFAULT_COMMAND='find -L . -type f -o -type d -o -type l | sed 1d | cut -b3- | grep -v -e .git/ -e .svn/ -e .hg/'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# Enhance the default experience
export FZF_DEFAULT_OPTS='--extended --multi --inline-info --prompt="fzf> "'
