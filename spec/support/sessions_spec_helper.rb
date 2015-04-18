module SessionsSpecHelper
  
  def create_login_user
    user = create :user
    login user
    user
  end
  
  def login(user)
    visit login_path
    fill_in "session[email]",     with: user.email
    fill_in "session[password]",  with: user.password
    click_button "Войти"
  end
  
  def logout
    visit root_path
    click_link "Выйти"
  end
end