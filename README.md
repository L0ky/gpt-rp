# Projet GPT RP avec Laravel Sail

Ce projet Laravel utilise Laravel Sail pour faciliter le développement et la configuration de l'environnement de développement à l'aide de Docker.

## Prérequis

Avant de commencer, vérifier si les éléments suivants sont installés sur la machine

-   [Docker](https://www.docker.com/)
-   [Docker Compose](https://docs.docker.com/compose/)
-   PHP

## Installation

1.  Cloner le projet à partir du lien Git :

    ```bash
    git clone https://github.com/votre-utilisateur/votre-projet.git
    ```

2.  Accéder au répertoire du projet :

    ```bash
    cd votre-projet
    ```

3.  Copier le fichier d'exemple .env.example pour créer le fichier .env :

    ```bash
    cp .env.example .env
    ```

#

## Installation des dépendances

Installer les dépendances du projet à l'aide de Composer :

```bash
./vendor/bin/sail composer install
```

#

## Lancement des conteneurs Docker

Lancer les conteneurs Docker à l'aide de Laravel Sail :

```bash
./vendor/bin/sail up -d
```

Les conteneurs Docker pour le serveur web, MySQL et autres services nécessaires seront démarrés.

#

## Migration et installation

Exécutez les migrations de base de données pour initialiser la base de données :

```bash
./vendor/bin/sail artisan migrate
```

## Accès au projet

Une fois les conteneurs Docker lancés, vous pouvez accéder à votre projet Laravel dans le navigateur :

```arduino
http://localhost/api/
```

Vérifier que les conteneurs Docker sont en cours d'exécution pour accéder au projet.

#

## Auteur

Loky
