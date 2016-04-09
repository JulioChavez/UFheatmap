class ApiController < ApplicationController
  def test
    render :json => {message:"Leap ... and the net will appear"}, :status => 200
  end
end
