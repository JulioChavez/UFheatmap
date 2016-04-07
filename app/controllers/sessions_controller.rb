class SessionsController < Devise::SessionsController
  def create
    super
  end

  def after_sign_in_path_for(resource)
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
