

Dado(/^que acesso o módulo de login$/) do
    @login_po = LoginPage.new
    @dash_po = DashPage.new
    @nav = Navbar.new

    @login_po.load

end
  
  Quando(/^faço login com a conta:$/) do |table|
    @user = table.rows_hash

    @login_po.do_login(@user)
    
  end
  
  Então(/^vejo o dashboard com a mensagem "([^"]*)" usuário$/) do |hello|
    expect(@dash_po.welcome.text).to have_content "#{hello} #{@user['Nome']}"
  end

  Então(/^vejo o email do usuário no menu superior$/) do
    expect(@nav.usermenu.text).to eql@user['Email']
  end
  
  Então(/^vejo a mensagem de erro "([^"]*)"$/) do |message_errors|
    expect(@login_po.errors.text).to eql message_errors
  end
  
