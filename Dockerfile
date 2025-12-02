FROM php:8.2-cli

# Extensiones PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql zip

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y git unzip libzip-dev

# Instalar Composer
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Copiar backend
WORKDIR /app
COPY backend/ ./backend

# Backend: dependencias
WORKDIR /app/backend
RUN composer install --no-dev --optimize-autoloader

# Copiar frontend compilado (ya hecho localmente)
COPY frontend/dist/catalogo-peliculas/ ./backend/public/

WORKDIR /app/backend
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
