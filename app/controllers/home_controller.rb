class HomeController < ApplicationController
  before_action :check_roles
  def new
  end

  # Checks if the user is an Attendee. If not, redirect to homepage
  def check_roles
    if (user_signed_in?)
      if (current_user.has_role? :attendee)
        redirect_to "/events"
      elsif (current_user.has_role? :organizer)
        redirect_to get_organizer_path(current_user.id)
      end
    end
  end

  private
    def get_organizer_path(id)
      return users_show_path + "?id=#{current_user.id}"
    end
end
