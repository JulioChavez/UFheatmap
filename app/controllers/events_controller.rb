class EventsController < ApplicationController
  before_action :redirect_if_not_organizer, only: [:show, :new, :create, :edit, :update, :destroy, :attending]
  before_action :redirect_if_not_attendee, only: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  @is_attending ||= false

  # GET /events
  # GET /events.json
  def index
    if @is_attending
      puts "In IndexView ... is_attending == true"
      @events = User.find(current_user.id).events
      @is_attending = false
    else
      puts "In IndexView ... is_attending == false"
      @events = Event.order(confirmed_attendees: :desc) # Trending
      #  @events = Event.order(start_time:)                # Latest
      #  @events = User.find(current_user.id).events       # Attending
    end

    if params["food"]
      @events = @events.where(food: true)
      # puts "temp_data.find_by food: true OUTPUT:"
      # puts temp_data.where(food: true)

    end

    if params["swag"]
      @events = @events.where(swag: true)
      # puts "temp_data.find_by swag: true OUTPUT:"
      # puts temp_data.find_by swag: true
    end

    if params["prizes"]
      @events = @events.where(prizes: true)
      # puts "temp_data.find_by prizes: true OUTPUT:"
      # puts temp_data.find_by prizes: true
    end
  end

  #GET /attending
  def attending
    @events = User.find(current_user.id).events

    if params["food"]
      @events = @events.where(food: true)
      # puts "temp_data.find_by food: true OUTPUT:"
      # puts temp_data.where(food: true)

    end

    if params["swag"]
      @events = @events.where(swag: true)
      # puts "temp_data.find_by swag: true OUTPUT:"
      # puts temp_data.find_by swag: true
    end

    if params["prizes"]
      @events = @events.where(prizes: true)
      # puts "temp_data.find_by prizes: true OUTPUT:"
      # puts temp_data.find_by prizes: true
    end

  end

  #GET /latest
  def latest
    @events = Event.order(:start_time)

    if params["food"]
      @events = @events.where(food: true)
      # puts "temp_data.find_by food: true OUTPUT:"
      # puts temp_data.where(food: true)

    end

    if params["swag"]
      @events = @events.where(swag: true)
      # puts "temp_data.find_by swag: true OUTPUT:"
      # puts temp_data.find_by swag: true
    end

    if params["prizes"]
      @events = @events.where(prizes: true)
      # puts "temp_data.find_by prizes: true OUTPUT:"
      # puts temp_data.find_by prizes: true
    end

  end


  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    puts "****************************"
    puts "In Event-->Create View..."
    puts "event_params: "
    puts event_params

    if (Event.exists?(title: event_params["title"]))
      puts "FOUND EVENT..."
      puts event_params["title"]
      puts "****************************"

      @event = Event.find_by title: event_params["title"]
      @event.description = event_params["description"]
      @event.start_time = event_params["start_time"]
      @event.food = event_params["food"]
      @event.swag = event_params["swag"]
      @event.prizes = event_params["prizes"]
      @event.street = event_params["street"]
      @event.city = event_params["city"]
      @event.state = event_params["state"]
      @event.zip_code = event_params["zip_code"]
    else
      puts "CREATING EVENT..."
      puts event_params["title"]
      puts "****************************"
      @event = Event.new(event_params)
      @event.creator_id = current_user.id
      @event.confirmed_attendees = 0
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def increment
    @event = Event.find(params[:id])

    if (!@event.users.include?(current_user))
      # puts "*****************"
      # puts "Attendee not found. Adding #{current_user.first_name} to the event list..."
      # puts "*****************"
      @event.users << current_user
      render json: { success: @event.increment_attendance }, status: :ok

    else
      # puts "*****************"
      # puts "You are already attending this event!"
      # puts "*****************"
      render :nothing => true, :status => :ok
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to :back, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :food, :swag, :prizes, :confirmed_attendees, :declined_attendees, :street, :city, :state, :zip_code)
    end

  # Checks if the user is an Attendee. If not, redirect to homepage
  private
    def redirect_if_not_attendee
      if (!current_user.has_role? :attendee)
      #  redirect_to "/"
      end
    end

    # Checks if the user is an Organizer. If not, redirect to homepage
    def redirect_if_not_organizer
      if (!current_user.has_role? :organizer)
        #redirect_to "/"
      end
    end
end
