
O blog deverá ser desenvolvido apenas utilizando:

    Ruby on Rails;

    HTML + CSS + JS + Bootstrap (opcionalmente);

    Banco de dados relacional, como PostgreSQL, por exemplo.

Não, você não precisa desenvolver uma app para o backend e outra para o frontend.

 

O blog deverá ser dotado das seguintes funcionalidades:

    Área deslogada onde é possível:

        ver os posts publicados por todos os usuários ordenados do mais novo para o mais antigo;

        os posts publicados devem ter paginação ao atingirem 3 publicações, onde o 4º post irá para a página 2 e daí em diante, ou seja, cada página deverá ter até 3 posts.

        fazer comentários anônimos;

        cadastrar um novo usuário;

        fazer login com um usuário cadastrado;

        recuperar a senha do usuário.

    Área logada onde é possível:

        redigir e publicar um post;

        editar e apagar posts já publicados pelo próprio usuário loggado;

        fazer comentários identificados através do login;

        editar o seu cadastro de usuário;

        alterar a senha do usuário loggado.

Você poderá usar quaisquer gems que desejar para acelerar o seu desenvolvimento.

Opcionais:

    Se conseguir, escrever testes automatizados simples;

    Se conseguir, implemente internacionalização;

    Se conseguir, adicione tags aos seus post, assim como filtros para utilizar as tags cadastradas. As tags deverão ser implementadas como uma nova tabela no seu modelo, associada aos posts;

    SUPER DIFERENCIAL: Se conseguir, crie a possibilidade de upload de arquivo TXT para criação de um ou mais posts, ou criação de múltiplas tags, utilizando Sidekiq para processamento assíncrono.
