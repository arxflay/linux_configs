setopt prompt_subst
setopt auto_cd

HISTSIZE=10000
SAVEHIST=10000

HISTFILE=$HOME/.cache/.zhistory

ENABLE_CORRECTION="true"

source /usr/share/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh_plugins/agnoster-zsh-theme/agnoster.zsh-theme
export PROMPT="${(F)AGNOSTER_PROMPT_SEGMENTS[@]}"