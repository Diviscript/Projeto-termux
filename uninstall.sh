#!/data/data/com.termux/files/usr/bin/bash

clear
echo "🧹 Removendo Cyber Azul AMOLED Pack..."

# Restaurar backup
if [ -d "$HOME/.backup-termux" ]; then
  cp ~/.backup-termux/* ~/
  echo "♻️ Configuração restaurada"
else
  echo "⚠️ Nenhum backup encontrado"
fi

# Remover plugins
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
rm -rf ~/.oh-my-zsh/custom/themes/powerlevel10k

echo
echo "✅ DESINSTALAÇÃO CONCLUÍDA"
echo "Feche e abra o Termux"
