# Created by newuser for 5.7.1
setopt prompt_subst
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.cache/.zhistory
source /usr/share/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh_plugins/agnoster-zsh-theme/agnoster.zsh-theme
export PROMPT="${(F)AGNOSTER_PROMPT_SEGMENTS[@]}"
#export PROMPT="[%n@%M] %d ~> "
