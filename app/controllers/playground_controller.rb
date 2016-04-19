class PlaygroundController < ApplicationController
	@data = []

	def index

		EM.epoll
		EM.run do
		  #trap("TERM") { stop }
		  #trap("INT")  { stop }

		  ws = WebSocket::EventMachine::Client.connect(:host => "0.0.0.0", :port => 8080)
		  #ws = WebSocket::EventMachine::Client.connect(uri: => "ws://localhost:8080")

		  ws.onopen do
		    puts "Connected"
		    ws.send "Send data"
		   
		  end

		  ws.onmessage do |msg, type|
		    @data = JSON.parse(msg) 
		    stop
		    #EventMachine.stop
		  end

		  ws.onclose do
		    puts "Disconnected"
		  end

		  def stop
  			puts "Terminating connection"
    		EventMachine.stop
  		  end

		end	
		puts @data
		#redirect_to(:controller => 'home', :action => 'new')
	end

end
