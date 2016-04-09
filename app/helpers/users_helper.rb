module UsersHelper
  def organizer_path(id)
    return users_show_path + "?id=#{current_user.id}"
  end
end
