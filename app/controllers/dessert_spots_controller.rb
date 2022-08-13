class DessertSpotsController < ApplicationController
  def index
    matching_dessert_spots = DessertSpot.all

    @list_of_dessert_spots = matching_dessert_spots.order({ :created_at => :desc })

    render({ :template => "dessert_spots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_dessert_spots = DessertSpot.where({ :id => the_id })

    @the_dessert_spot = matching_dessert_spots.at(0)

    render({ :template => "dessert_spots/show.html.erb" })
  end

  def create
    the_dessert_spot = DessertSpot.new
    the_dessert_spot.loc_name = params.fetch("query_loc_name")
    the_dessert_spot.visitor_id = session[:user_id]
    the_dessert_spot.category_id = params.fetch("query_category_id")
    the_dessert_spot.desc = params.fetch("query_desc")
    the_dessert_spot.image = params.fetch("query_image")

    if the_dessert_spot.valid?
      the_dessert_spot.save
      redirect_to("/dessert_spots", { :notice => "Dessert spot created successfully." })
    else
      redirect_to("/dessert_spots", { :alert => the_dessert_spot.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dessert_spot = DessertSpot.where({ :id => the_id }).at(0)

    the_dessert_spot.loc_name = params.fetch("query_loc_name")
    the_dessert_spot.visitor_id = params.fetch("query_visitor_id")
    the_dessert_spot.category_id = params.fetch("query_category_id")
    the_dessert_spot.desc = params.fetch("query_desc")
    the_dessert_spot.image = params.fetch("query_image")

    if the_dessert_spot.valid?
      the_dessert_spot.save
      redirect_to("/dessert_spots/#{the_dessert_spot.id}", { :notice => "Dessert spot updated successfully."} )
    else
      redirect_to("/dessert_spots/#{the_dessert_spot.id}", { :alert => the_dessert_spot.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dessert_spot = DessertSpot.where({ :id => the_id }).at(0)

    the_dessert_spot.destroy

    redirect_to("/dessert_spots", { :notice => "Dessert spot deleted successfully."} )
  end
end
