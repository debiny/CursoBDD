#language: pt

Funcionalidade: Cadastro de clientes
    Sendo um assinante do Invoices
    Posso cadastrar clientes
    Para fazer gestão e ter constrole dos consumidores que comprar meus serviços

    Contexto: Novo cliente
        
        Dado que acesso o cadastro de clientes com o usuario:
            | Email | kato.danzo@qaninja.io |
            | Senha | secret                |


    @logout @novo_cliente
    Cenario: Cadastrar novo cliente

       Quando faço o cadastro do seguinte cliente:
            | Nome     | Debiny Rocha       |
            | Telefone | 11 96160 0923         |
            | Email    | debiny@ig.com         |
            | Sexo     | F                     |
            | Tipo     | Gold                  |
            | Obs      | Lorem Impsum Cacildis |
            | Promo    | Sim                   |
        Então vejo esse cadastro na lista de clientes

        

    @duplicado
    Cenario: Não permite duplicado

        Quando faço o cadastro do seguinte cliente:
            | Nome     | Fernando Duplicado    |
            | Telefone | 11 97194-9904         |
            | Email    | fernando@dup.net      |
            | Sexo     | M                     |
            | Tipo     | Prime                 |
            | Obs      | Lorem Impsum Cacildis |
            | Promo    | Sim                   |
        Mas ja existe um cliente com o email duplicado
        Então vejo a mensagem de erro:
        """
        Já existe um cliente cadastrado com o email informando!
        """
        E deve exibir somente 1 registro na lista de clientes