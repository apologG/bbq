module UsersHelper
  
  def current_user_can_edit?(event)
   user_signed_in? && event.user == current_user
  end

   def user_avatar(user)
    #todo: user real avatars
    asset_path('user.png')
  end

end
