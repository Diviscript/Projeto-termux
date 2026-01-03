#!/data/data/com.termux/files/usr/bin/bash

clear
echo "🔵 Projeto Termux — Cyber Azul AMOLED"
echo "🚀 Instalador automático v1.1"
echo

# ===============================
# VERIFICAÇÃO: TERMUX
# ===============================
if [ ! -d "/data/data/com.termux" ]; then
  echo "❌ Este script deve ser executado no Termux"
  exit 1
fi

# ===============================
# DEPENDÊNCIAS
# ===============================
pkg update -y
pkg install -y git zsh curl termux-api

# ===============================
# BACKUP AUTOMÁTICO
# ===============================
echo "📦 Criando backup automático..."
mkdir -p ~/.backup-termux
cp ~/.zshrc ~/.p10k.zsh ~/.backup-termux 2>/dev/null

# ===============================
# OH MY ZSH (SILENCIOSO)
# ===============================
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚡ Instalando Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# ===============================
# PLUGINS
# ===============================
git clone https://github.com/zsh-users/zsh-autosuggestions \
  $ZSH_CUSTOM/plugins/zsh-autosuggestions 2>/dev/null

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  $ZSH_CUSTOM/plugins/zsh-syntax-highlighting 2>/dev/null

# ===============================
# POWERLEVEL10K
# ===============================
git clone https://github.com/romkatv/powerlevel10k.git \
  $ZSH_CUSTOM/themes/powerlevel10k 2>/dev/null

# ===============================
# CONFIGURAÇÕES
# ===============================
echo "🎨 Aplicando tema Cyber Azul..."
cp files/zshrc ~/.zshrc
cp files/p10k.zsh ~/.p10k.zsh

# ===============================
# ZSH PADRÃO
# ===============================
chsh -s zsh

# ===============================
# FINAL
# ===============================
echo
echo "✅ INSTALAÇÃO CONCLUÍDA COM SUCESSO"
echo
echo "⚠️ PASSO FINAL OBRIGATÓRIO:"
echo "Termux → Settings → Appearance"
echo "Color scheme → White On Black"
echo "Depois feche e abra o Termux"
echo
echo "😈 Bem-vindo ao Cyber Azul AMOLED"
