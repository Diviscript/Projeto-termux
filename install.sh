#!/data/data/com.termux/files/usr/bin/bash

echo "🔵 CYBER AZUL AMOLED PACK 🔵"
echo ""

# Atualizar pacotes básicos
pkg update -y
pkg install -y zsh git

# Instalar Oh My Zsh se não existir
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

# Instalar plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions 2>/dev/null

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 2>/dev/null

# Instalar Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git \
  ~/.oh-my-zsh/custom/themes/powerlevel10k 2>/dev/null

# Copiar configs
cp files/zshrc ~/.zshrc
cp files/p10k.zsh ~/.p10k.zsh

# Definir ZSH como padrão
chsh -s zsh

echo ""
echo "✅ Pack instalado!"
echo "👉 Vá em Termux > Settings > Appearance > Color scheme > White On Black"
echo "👉 Feche e abra o Termux"
