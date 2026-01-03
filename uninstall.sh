#!/data/data/com.termux/files/usr/bin/bash

echo "🧹 Projeto Termux — Uninstall"
echo "-----------------------------"

# Verificar se está rodando no Termux
if [ -z "$PREFIX" ] || [[ "$PREFIX" != *"com.termux"* ]]; then
  echo "❌ Este script deve ser executado no Termux."
  exit 1
fi

echo "📦 Removendo configurações do projeto..."

# Restaurar backup se existir
if [ -d "$HOME/backup-zsh" ]; then
  echo "🔄 Backup encontrado. Restaurando..."
  cp -r "$HOME/backup-zsh/." "$HOME/"
else
  echo "⚠️ Nenhum backup encontrado."
fi

# Remover arquivos criados
rm -f ~/.p10k.zsh
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
rm -rf ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Voltar shell padrão
chsh -s bash >/dev/null 2>&1

echo "✅ Uninstall concluído!"
echo "👉 Feche e abra o Termux novamente."
