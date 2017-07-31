class EventsController < ApplicationController
    def index
        @event = Event.all
    end

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
        @event = Event.includes(:messages).find_by(id: params[:id])
        @message = Message.new
    end

private
    def event_params
            params.require(:event).permit(:eventname, :description)
    end
end

