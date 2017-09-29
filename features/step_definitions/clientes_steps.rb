#encoding: utf-8

Dado(/^que acesso o cadastro de clientes com o usuario:$/) do |table|
    @user = table.rows_hash

    @login_po.load
    @login_po.do_login(@user)
    @dash_po.wait_for_welcome
    @nav.customers.click
    @customer_po.new_customer.click
    
  end
  
  Quando(/^faço o cadastro do seguinte cliente:$/) do |table|
    @customer = table.rows_hash

    new_customer(@customer)

    sleep(5)  
  end
  

  Então(/^vejo esse cadastro na lista de clientes$/) do
    pending # Write code here that turns the phrase above into concrete actions
  end
  