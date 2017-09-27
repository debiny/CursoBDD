

class LoginPage < SitePrism::Page
    set_url '/login'
    element :email, '#email'
    element :password, 'input[placeholder$=senha]'
    element :sign_in, 'button[id*=btnLogin]'
    element :errors, '#login-errors'
end