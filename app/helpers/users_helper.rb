module UsersHelper
  
  def short_user_name(user)
    "#{user.first_name} #{user.last_name[0]}."
  end
  
  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end
end
