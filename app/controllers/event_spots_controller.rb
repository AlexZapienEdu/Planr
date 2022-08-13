class EventSpotsController < ApplicationController
  def index
    matching_event_spots = EventSpot.all

    @list_of_event_spots = matching_event_spots.order({ :created_at => :desc })

    render({ :template => "event_spots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_event_spots = EventSpot.where({ :id => the_id })

    @the_event_spot = matching_event_spots.at(0)

    render({ :template => "event_spots/show.html.erb" })
  end

  def create
    the_event_spot = EventSpot.new
    the_event_spot.event_name = params.fetch("query_event_name")
    the_event_spot.visitor_id = session[:user_id]

    input_cat = params.fetch("query_category_name")
    matching_categories = Category.where({ :category_name => input_cat}).at(0)
    the_event_spot.category_id = matching_categories.id

    the_event_spot.desc = params.fetch("query_desc")
    the_event_spot.image = params.fetch("query_image")

    if the_event_spot.valid?
      the_event_spot.save
      redirect_to("/event_spots", { :notice => "Event spot created successfully." })
    else
      redirect_to("/event_spots", { :alert => the_event_spot.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event_spot = EventSpot.where({ :id => the_id }).at(0)

    the_event_spot.event_name = params.fetch("query_event_name")
    the_event_spot.visitor_id = params.fetch("query_visitor_id")
    the_event_spot.category_id = params.fetch("query_category_id")
    the_event_spot.desc = params.fetch("query_desc")
    the_event_spot.image = params.fetch("query_image")

    if the_event_spot.valid?
      the_event_spot.save
      redirect_to("/event_spots/#{the_event_spot.id}", { :notice => "Event spot updated successfully."} )
    else
      redirect_to("/event_spots/#{the_event_spot.id}", { :alert => the_event_spot.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event_spot = EventSpot.where({ :id => the_id }).at(0)

    the_event_spot.destroy

    redirect_to("/event_spots", { :notice => "Event spot deleted successfully."} )
  end
end
