# 1️⃣ Imagen base con PHP + Composer
FROM php:8.2-cli

# 2️⃣ Instalar extensiones necesarias de Laravel
RUN docker-php-ext-install pdo pdo_mysql

# 3️⃣ Instalar Node.js (para Angular)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# 4️⃣ Copiar el backend y frontend
WORKDIR /app
COPY backend/ ./backend
COPY frontend/ ./frontend

# 5️⃣ Instalar dependencias backend
WORKDIR /app/backend
RUN composer install --no-dev --optimize-autoloader

# 6️⃣ Instalar dependencias frontend y construir
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# 7️⃣ Copiar frontend compilado al backend/public
RUN cp -r dist/catalogo-peliculas/* ../backend/public/

# 8️⃣ Exponer puerto y comando por defecto
WORKDIR /app/backend
EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
