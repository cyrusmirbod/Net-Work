class Loginform < SitePrism::Page
#set_url "http://cat-hotfix.dave:18080/share/"

  element :user_name, :id, 'username'
  element :password, :id, 'password'
  element :login_button, :id, 'btn-login'
  
end




