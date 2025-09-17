# Use the official PHP image with extensions for Laravel
FROM php:8.2-apache

# Instala dependências do sistema e extensões necessárias
RUN apt-get update && apt-get install -y \
    libpq-dev \
    git \
    unzip \
    curl \
    && docker-php-ext-install pdo pdo_pgsql

RUN a2enmod rewrite

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 22.19.0

# Instala o Composer globalmente
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Instala NVM, Node.js e configura ambiente para todos os shells
RUN mkdir -p $NVM_DIR && \
    curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSION && \
    nvm use default && \
    echo 'export NVM_DIR="$NVM_DIR"' > /etc/profile.d/nvm.sh && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> /etc/profile.d/nvm.sh && \
    echo 'export PATH="$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH"' >> /etc/profile.d/nvm.sh

RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# Exponha a porta padrão do Apache
EXPOSE 80

# Inicia o Apache em foreground
CMD ["apache2-foreground"]
