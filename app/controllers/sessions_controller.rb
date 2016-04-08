class SessionsController < Devise::SessionsController
  def create
    super
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
