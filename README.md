# Mini-Facebook

## Description

Mini-Facebook est une implémentation en Bash d'un réseau social minimaliste permettant aux utilisateurs de créer un compte, d'ajouter des amis, de publier des messages et de consulter leur mur. Ce projet illustre les concepts de synchronisation des processus et de communication interprocessus via des FIFOs nommés.

---

## Installation et Exécution

### 1. Prérequis

- Système d'exploitation basé sur Unix (Linux ou macOS)
- Bash installé
- Terminal

### 2. Cloner le projet

```bash
git clone https://github.com/nptsp/mini-facebook.git
cd mini-facebook
```
### 3. rendre le script exécutable
```bash
chmod u+x *.sh
```

### 4. Démarrer le serveur (dans un terminal)
```bash
./mini-facebook.sh
```

 ### 5. Démarrer dans un autre terminal
```bash
./client.sh
```


