FROM php:8.2-cli

# Extensiones PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql

# Instalar utilidades necesarias para Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    && docker-php-ext-install zip

# Instalar Composer
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Instalar Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Copiar proyecto
WORKDIR /app
COPY backend/ ./backend
COPY frontend/ ./frontend

# Backend: dependencias
WORKDIR /app/backend
RUN composer install --no-dev --optimize-autoloader

# Frontend: dependencias y build
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Copiar frontend compilado a backend/public
RUN cp -r dist/catalogo-peliculas/* ../backend/public/

WORKDIR /app/backend
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]