# AuthApp

AuthApp é uma aplicação de autenticação de usuários construída com Ruby on Rails. Esta aplicação permite que os usuários se cadastrem, façam login e visualizem seus perfis.

## Requisitos

- Ruby versão especificada em `.ruby-version`
- Rails 7.2.1
- Node.js e Yarn

## Configuração

1. Clone o repositório:

   ```sh
    git clone https://github.com/seu-usuario/auth_app.git
    cd auth_app
   ```

2. Instale as dependências:
  ```sh
    bundle install
    yarn install
  ```

3. Inicie o servidor:
  ```sh
    rails server
  ```


## Testes
Para rodar a suíte de testes, execute:
  ```sh
    bundle exec rspec
  ```
Esse projeto possui simplecov que é uma gem que verfifica a cobertura de testes. Para rodar olhando a cobertura:
  ```sh
    COVERAGE=true bundle exec rspec
  ```
  