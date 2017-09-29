
class CustomersPage < SitePrism::Page  
    element :new_customer, "#dataview-insert-button"
    element :name, 'input[name=name]'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :gender_m, 'input[name=radio-m]'
    element :gender_f, 'input[name=radio-f]'
    element :type, 'select[id=type-customer]'
    element :notes, 'textarea[name=note]'
    element :news, 'input[type=checkbox]'
    element :submit, '#form-submit-button'
    element :submit_cancel, '#form-cancel-button'

end