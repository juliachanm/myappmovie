#!/bin/bash

# Backend Laravel
cd backend

# Instalar dependencias si faltan
if [ ! -d "vendor" ]; then
    composer install --no-dev --optimize-autoloader
fi

# Migrar base de datos
php artisan migrate --force

# Levantar Laravel en el puerto que asigna Railway
php artisan serve --host=0.0.0.0 --port $PORT
