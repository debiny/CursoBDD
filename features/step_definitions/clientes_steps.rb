#encoding: utf-8


Dado(/^que acesso o cadastro de clientes com o usuario:$/) do |table|
  @user = table.rows_hash
  @login_po.load
  @login_po.do_login(@user)
  @dash_po.wait_for_welcome
  @nav.customers.click
end

Quando(/^faço o cadastro do seguinte cliente:$/) do |table|
  @customer = table.rows_hash
  remove_customer(@customer)
  @customer_po.new_customer.click
  new_customer(@customer)
end

Quando("ja existe um cliente com o email duplicado") do
  @customer_po.new_customer.click
  new_customer(@customer)
end

Então(/^vejo esse cadastro na lista de clientes$/) do
  @customer_po.search_text.set @customer['Email']
  @customer_po.search_button.click

  @customer_po.wait_for_list

  expect(@customer_po.lines.size).to eql 1

  expect(@customer_po.list.text).to have_content @customer['Nome']
  expect(@customer_po.list.text).to have_content @customer['Telefone']
  expect(@customer_po.list.text).to have_content @customer['Email']
end

Então("vejo a mensagem de erro:") do |message_error|
  expect(@customer_po.modal.text).to have_content message_error
end

Então("deve exibir somente {int} registro na lista de clientes") do |item|
  @customer_po.search_text.set @customer['Email']
  @customer_po.search_button.click
  @customer_po.wait_for_list

  expect(@customer_po.lines.size).to have_content item
end