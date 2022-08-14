class DinnerSpotsController < ApplicationController

  def index
    $matching_dinner_spots = DinnerSpot.all
    $list_of_dinner_spots = $matching_dinner_spots.order({ :created_at => :desc })

    render({ :template => "dinner_spots/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    $matching_dinner_spots = DinnerSpot.where({ :id => the_id })

    @the_dinner_spot = $matching_dinner_spots.at(0)

    render({ :template => "dinner_spots/show.html.erb" })
  end

  def create
    the_dinner_spot = DinnerSpot.new
    the_dinner_spot.loc_name = params.fetch("query_loc_name")
    the_dinner_spot.visitor_id = session[:user_id]

    #Taking in category name from drop down menu and finding associated id on category table
    input_cat = params.fetch("query_category_name")
    matching_categories = Category.where({ :category_name => input_cat}).at(0)
    the_dinner_spot.category_id = matching_categories.id

    the_dinner_spot.desc = params.fetch("query_desc")
    the_dinner_spot.image = params.fetch("query_image")

    if the_dinner_spot.valid?
      the_dinner_spot.save
      redirect_to("/dinner_spots", { :notice => "Dinner spot created successfully." })
    else
      redirect_to("/dinner_spots", { :alert => the_dinner_spot.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_dinner_spot = DinnerSpot.where({ :id => the_id }).at(0)

    the_dinner_spot.loc_name = params.fetch("query_loc_name")
    the_dinner_spot.visitor_id = session[:user_id]

    #Taking in category name from drop down menu and finding associated id on category table
    input_cat = params.fetch("query_category_name")
    matching_categories = Category.where({ :category_name => input_cat}).at(0)
    the_dinner_spot.category_id = matching_categories.id

    the_dinner_spot.desc = params.fetch("query_desc")
    the_dinner_spot.image = params.fetch("query_image")

    if the_dinner_spot.valid?
      the_dinner_spot.save
      redirect_to("/dinner_spots/#{the_dinner_spot.id}", { :notice => "Dinner spot updated successfully."} )
    else
      redirect_to("/dinner_spots/#{the_dinner_spot.id}", { :alert => the_dinner_spot.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_dinner_spot = DinnerSpot.where({ :id => the_id }).at(0)

    the_dinner_spot.destroy

    redirect_to("/dinner_spots", { :notice => "Dinner spot deleted successfully."} )
  end
end
