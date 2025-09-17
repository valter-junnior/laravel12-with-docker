#!/bin/bash
set -e

# Instala dependências PHP
composer install --no-interaction --prefer-dist --optimize-autoloader

# Instala dependências JS
npm install

# Build dos assets
npm run build

# Gera chave da aplicação
php artisan key:generate
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Executa migrations e seeders
php artisan migrate

# Permissões
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache
