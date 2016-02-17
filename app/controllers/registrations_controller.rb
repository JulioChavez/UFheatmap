class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if params[:organizer]
      @user.add_role :organizer #set user as organizer
    else
      @user.add_role :attendee #set user as defaut attendee
    end
  end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
    end
end
