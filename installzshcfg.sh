mkdir /usr/share/zsh_plugins
git -C /usr/share/zsh_plugins clone https://github.com/agnoster/agnoster-zsh-theme.git
git -C /usr/share/zsh_plugins clone https://github.com/marlonrichert/zsh-autocomplete.git
git -C /usr/share/zsh_plugins clone https://github.com/zsh-users/zsh-autosuggestions.git
git -C /usr/share/zsh_plugins clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cp configs/.zshrc ~/
cp configs/.zshenv ~/
