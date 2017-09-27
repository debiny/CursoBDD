#language: pt

Funcionalidade: Login
    Para poder gerenciar o meu negócio
    Sendo um Assinante
    Posso acessar o sistema Invoices

    Contexto: Acesso
        Dado que acesso o módulo de login

    @logout @smoke
    Cenário: Administrador faz login

        Quando faço login com a conta:
            | Nome  | Kato Danzo            |
            | Email | kato.danzo@qaninja.io |
            | Senha | secret                |
        Então vejo o dashboard com a mensagem "Olá," usuário
            E vejo o email do usuário no menu superior

    @tentativa
    Esquema do Cenario: Tentativa de login

        Quando faço login com a conta:
            | Email | <email> |
            | Senha | <senha> |
        Então vejo a mensagem de erro <msg_erro>

        Exemplos: 
        | email                  | senha   | msg_erro                   |
        | kato.danzo@qaninja.io  | test123 | "Senha inválida."          |
        | kato.danzo@qaninja.net | secret  | "Usuário não cadastrado."  |
        | kato.danzo&qaninja.io  | secret  | "Informe um email válido." |