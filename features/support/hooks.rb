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

