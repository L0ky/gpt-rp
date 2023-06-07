# Projet GPT RP avec Laravel Sail

Ce projet Laravel utilise Laravel Sail pour faciliter le développement et la configuration de l'environnement de développement à l'aide de Docker.

## Prérequis

Avant de commencer, vérifiez si les éléments suivants sont installés sur votre machine

-   [Docker](https://www.docker.com/)
-   [Docker Compose](https://docs.docker.com/compose/)
-   PHP

## Installation

1.  Clonez le projet à partir du lien Git :

    ```bash
    git clone https://github.com/L0ky/gpt-rp.git
    ```

2.  Accédez au répertoire du projet :

    ```bash
    cd gpt-rp
    ```

3.  Copiez le fichier d'exemple .env.example pour créer le fichier .env :

    ```bash
    cp .env.example .env
    ```

#

## Installation des dépendances

Installez les dépendances du projet à l'aide de Composer :

```bash
./vendor/bin/sail composer install
```

#

## Génération d'une clé pour l'application Laravel :

```bash
./vendor/bin/sail artisan key:generate
```

#

## Lancement des conteneurs Docker

Lancez les conteneurs Docker à l'aide de Laravel Sail :

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

#

## Accès au projet

Une fois les conteneurs Docker lancés, vous pouvez accéder à votre projet Laravel dans le navigateur :

```arduino
http://127.0.0.1/api/
```

#

## Accès à la documentation

```arduino
http://127.0.0.1/api/documentation
```

Vérifier que les conteneurs Docker sont en cours d'exécution pour accéder au projet.

#

## Accès à la documentation du projet

```arduino
http://127.0.0.1/api_doc/
```

#

## Auteur

Matti.O
