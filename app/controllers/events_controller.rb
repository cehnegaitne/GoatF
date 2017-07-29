class EventsController < ApplicationController
    def new
        @event = Event.new 
    end
    
    def create
        @event = Event.new(event_params)
        if @event.save
            flash[:success] = "New event created!"
            redirect_to @event
        else
        flash[:danger] = "Error when creating event."
        render 'new'
        end
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    def event_params
            params.require(:event).permit(:eventname, :description)
    end
    
    def index
        @event = Event.all
    end


end

