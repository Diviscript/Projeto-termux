#!/data/data/com.termux/files/usr/bin/bash

clear
echo "🔵 CYBER AZUL AMOLED PACK 🔵"
echo "🚀 Projeto Termux v1.0"
echo

pkg update -y
pkg install -y git zsh termux-api curl

# Backup
echo "📦 Criando backup..."
mkdir -p ~/.backup-termux
cp ~/.zshrc ~/.p10k.zsh ~/.backup-termux 2>/dev/null

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚡ Instalando Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

git clone https://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions 2>/dev/null

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 2>/dev/null

# Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git \
  $ZSH_CUSTOM/themes/powerlevel10k 2>/dev/null

# Copiar configs
echo "🎨 Aplicando tema Cyber Azul..."
cp files/zshrc ~/.zshrc
cp files/p10k.zsh ~/.p10k.zsh

# ZSH padrão
chsh -s zsh

echo
echo "✅ INSTALAÇÃO FINALIZADA!"
echo
echo "⚠️ PASSO OBRIGATÓRIO:"
echo "Termux → Settings → Appearance → Color scheme"
echo "👉 Selecione: White On Black"
echo "👉 Feche e abra o Termux"
echo
echo "🔥 Bem-vindo ao Cyber Azul AMOLED 😈"
