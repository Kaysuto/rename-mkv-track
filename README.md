# 🧰 rename-mkv-track

Script shell pour renommer le nom d’une piste dans des fichiers MKV sans remux complet, en utilisant `mkvpropedit` de MKVToolNix.

---

## 📁 Fichiers du dépôt

- `rename-mkv-track.sh` – script shell pour Linux, macOS et Windows via Git Bash ou WSL
- `rename-mkv-track.bat` – script batch pour Windows

---

## ✅ Prérequis

- Linux, macOS ou Windows (avec Git Bash ou WSL)
- [MKVToolNix](https://mkvtoolnix.org/)
- `mkvpropedit` disponible dans le terminal

---

## 🧠 Ce que fait le script

Le script modifie directement les en-têtes Matroska pour changer le **nom d’une piste** (titre de piste), sans réencoder la vidéo et sans remux complet.

---

## 🎯 Pistes ciblables

- `track:v1` = première piste vidéo
- `track:a1` = première piste audio
- `track:s1` = première piste de sous-titres

Tu peux adapter cette valeur dans le script selon la piste que tu souhaites modifier.

---

## ▶️ Utilisation

Place tes fichiers `.mkv` dans le dossier de travail, puis exécute le script adapté à ton système.

### 🐧🍎 Linux / macOS / Windows (Git Bash ou WSL)

```bash
chmod +x rename-mkv-track.sh
./rename-mkv-track.sh
```

### 🪟 Windows

```bat
rename-mkv-track.bat
```

## 🛠️ Personnalisation

Le script peut être configuré pour :

- choisir la piste à modifier ;
- définir un nouveau nom de piste ;
- effacer un nom de piste existant.

---

## 📌 Exemples d’usage

Renommer une piste vidéo en `HDLight` :

- cible : `track:v1`
- nom : `HDLight`

Renommer une piste audio en `French AAC` :

- cible : `track:a1`
- nom : `French AAC`

---

## 💡 Conseils

- Teste d’abord sur **un seul fichier** pour confirmer que la bonne piste est ciblée.
- Garde une copie de l’original si tu modifies beaucoup de fichiers d’un coup.
