# Projeto de Geolocalização baseada no IP

Este projeto é uma aplicação web simples que demonstra a funcionalidade de geolocalização baseada no endereço IP do cliente. Os dados são persistidos em memória durante a execução da aplicação.

## Pré-requisitos

Antes de iniciar, certifique-se de ter o RVM (Ruby Version Manager), Ruby e Rails instalados no seu sistema. Caso ainda não tenha, você pode seguir as instruções de instalação no [site oficial do RVM](https://rvm.io/) e [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html).

## Como rodar o projeto

1. Clone este repositório para o seu ambiente local:

    ```bash
    git clone https://github.com/seu-usuario/nome-do-repositorio.git
    ```

2. Navegue até o diretório do projeto:

    ```bash
    cd nome-do-repositorio
    ```

3. Instale as dependências do projeto:

    ```bash
    bundle install
    ```

5. Inicie o servidor local:

    ```bash
    rails server
    ```

6. Abra seu navegador e acesse `http://localhost:3000` para visualizar a aplicação.

## Observações

- Certifique-se de ter as portas necessárias liberadas, e o Ruby e o Rails configurados corretamente no seu sistema.
- Os dados de geolocalização são obtidos com base no endereço IP do cliente.
- Os dados são persistidos em memória e serão perdidos ao reiniciar a aplicação.

Sinta-se à vontade para explorar e adaptar o projeto de acordo com suas necessidades! Se precisar de ajuda adicional, consulte a documentação oficial do Ruby on Rails em [https://guides.rubyonrails.org/](https://guides.rubyonrails.org/).