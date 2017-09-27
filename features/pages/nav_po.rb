

class Navbar < SitePrism::Page
    element :usermenu, '#usermenu'
    element :logout, 'a[href$=logout]'
end