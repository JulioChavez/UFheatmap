class SessionsController < Devise::SessionsController
  def create
    super
    puts "JSAHFLKJHFJKHFLKJJKFHLJFFHSKJLFH HUGH's Here"
  end


  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end
