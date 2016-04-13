class SessionsController < Devise::SessionsController
  def create
    super
    # redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
