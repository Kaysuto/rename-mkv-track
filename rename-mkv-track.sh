#!/usr/bin/env sh

set -eu

echo "🧰 rename-mkv-track"
echo

if ! command -v mkvpropedit >/dev/null 2>&1; then
  echo "❌ mkvpropedit introuvable."
  echo "Installe MKVToolNix puis réessaie."
  exit 1
fi

printf "🎯 Piste à modifier (ex: track:v1, track:a1, track:s1) : "
IFS= read -r TRACK

if [ -z "$TRACK" ]; then
  echo "❌ Aucune piste indiquée."
  exit 1
fi

printf "✏️ Nouveau nom de piste (laisser vide pour effacer) : "
IFS= read -r NEWNAME

FOUND=0

for FILE in ./*.mkv; do
  if [ ! -e "$FILE" ]; then
    continue
  fi

  FOUND=1
  echo
  echo "📄 Traitement : $FILE"

  if [ -n "$NEWNAME" ]; then
    mkvpropedit "$FILE" --edit "$TRACK" --set "name=$NEWNAME"
  else
    mkvpropedit "$FILE" --edit "$TRACK" --delete name
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "⚠️ Aucun fichier .mkv trouvé dans ce dossier."
  exit 1
fi

echo
echo "✅ Terminé."
