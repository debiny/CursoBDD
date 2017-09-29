

class Navbar < SitePrism::Page
    element :usermenu, '#usermenu'
    element :logout, 'a[href$=logout]'
    element :customers, "a[href*='customers']"
end