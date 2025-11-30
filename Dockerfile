# 1️⃣ Imagen base con PHP
FROM php:8.2-cli

# 2️⃣ Extensiones PHP necesarias para Laravel
RUN docker-php-ext-install pdo pdo_mysql

# 3️⃣ Instalar Composer
WORKDIR /tmp
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# 4️⃣ Instalar Node.js (para Angular)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# 5️⃣ Copiar backend y frontend
WORKDIR /app
COPY backend/ ./backend
COPY frontend/ ./frontend

# 6️⃣ Instalar dependencias backend
WORKDIR /app/backend
RUN composer install --no-dev --optimize-autoloader

# 7️⃣ Instalar dependencias frontend y construir
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# 8️⃣ Copiar frontend compilado a backend/public
RUN cp -r dist/catalogo-peliculas/* ../backend/public/

# 9️⃣ Exponer puerto y comando por defecto
WORKDIR /app/backend
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
