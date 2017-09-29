

class LoginPage < SitePrism::Page
    set_url '/login'
    element :email, '#email'
    element :password, 'input[placeholder$=senha]'
    element :sign_in, 'button[id*=btnLogin]'
    element :errors, '#login-errors'

    def do_login(userParam)
        self.email.set userParam['Email']
        self.password.set userParam['Senha']
        self.sign_in.click
    end
end