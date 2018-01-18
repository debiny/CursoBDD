
module Helpers
    def new_customer(customer)

        @customer_po.name.set customer['Nome']
        @customer_po.phone.set customer['Telefone']
        @customer_po.email.set customer['Email']
    
        @customer_po.gender_m.click if customer['Sexo'] == 'M'
        @customer_po.gender_m.click if customer['Sexo'] == 'F'
    
        @customer_po.type.find('option', text: customer['Tipo']).select_option
        @customer_po.notes.set customer['Obs']
        @customer_po.news.click if customer['Promo'] == 'Sim'

        @customer_po.submit.click
    end

    def remove_customer(customer)
        @customer_po.search_text.set customer['Email']
        @customer_po.search_button.click

        @customer_po.lines.each do|reg|
            @customer_po.remove_icon.first.click
            @customer_po.modal_yes.click    
        end

    end
end