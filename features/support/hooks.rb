Before do
    @login_po = LoginPage.new
    @dash_po = DashPage.new
    @customer_po = CustomersPage.new
    @nav = Navbar.new
end


After('@logout') do
    @nav.usermenu.click
    @nav.logout.click
end

After do |scenario|
    ### print da página
    # remove caractéres inválidos
    # do nome do cenário para gerar o nome do arquivo
    @file_name = scenario.name.gsub(' ', '_')
    @file_name = @file_name.gsub(',', '').gsub('#', '')
    @file_name = @file_name.gsub('(', '').gsub(')', '')
  
    # define o nome do arquivo para o screenshot
    @target = "reports/screeshots/#{@file_name.downcase!}.png"
  
    # tira screeshot
    page.save_screenshot(@target)
    embed(@target, 'image/png', 'Clique aqui para ver a evidência')
  end