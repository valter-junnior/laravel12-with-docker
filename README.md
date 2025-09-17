# Laravel 12 com Docker - Setup e Instalação

## Pré-requisitos

- Docker e Docker Compose instalados
- (Opcional) Git instalado

## Passos para rodar o projeto

### 1. Clone o repositório
```bash
git clone https://github.com/valter-junnior/laravel12-with-docker.git
cd laravel12-with-docker.
```

### 2. Build e start dos containers
```bash
docker compose up -d --build
```

### 3. Instalação das dependências e configuração do ambiente

Execute o script de instalação: dentro do container:
```bash
bash .docker/install.sh"
```

Esse script irá:
- Instalar dependências PHP (`composer install`)
- Instalar dependências JS (`npm install`)
- Buildar os assets (`npm run build`)
- Gerar a chave da aplicação (`php artisan key:generate`)
- Dar permissões corretas para `storage` e `bootstrap/cache`

### 4. Acesse a aplicação

Acesse no navegador:
```
http://localhost
```

---

## Observações
- O banco de dados PostgreSQL estará disponível na porta 5432.
- O volume `pgdata` garante persistência dos dados do banco.
- Para rodar comandos artisan, use:
  ```bash
  docker exec -it seubazzar_app php artisan <comando>
  ```
- Para instalar novas dependências, use o mesmo processo dentro do container.
