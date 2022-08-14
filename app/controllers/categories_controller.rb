class CategoriesController < ApplicationController

  def index
    $matching_categories = Category.all

    $list_of_categories = $matching_categories.order({ :created_at => :desc })
    

    render({ :template => "categories/index.html.erb" })
  end

  def show
    #initializing Dinner_Spot data
    $matching_dinner_spots = DinnerSpot.all
    $list_of_dinner_spots = $matching_dinner_spots.order({ :created_at => :desc })

    #initializing Dessert_Spot data
    $matching_dessert_spots = DessertSpot.all
    $list_of_dessert_spots = $matching_dessert_spots.order({ :created_at => :desc })

    #initializing Event_Spot data
    $matching_event_spots = EventSpot.all
    $list_of_event_spots = $matching_event_spots.order({ :created_at => :desc })

    the_id = params.fetch("path_id")

    $matching_categories = Category.where({ :id => the_id })

    @the_category = $matching_categories.at(0)

    render({ :template => "categories/show.html.erb" })
  end

  def create
    the_category = Category.new
    the_category.category_name = params.fetch("query_category_name")
   
    if the_category.valid?
      the_category.save
      redirect_to("/categories", { :notice => "Category created successfully." })
    else
      redirect_to("/categories", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def update
    $matching_categories = Category.all
    $list_of_categories = $matching_categories.order({ :created_at => :desc })

    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.category_name = params.fetch("query_category_name")
   

    if the_category.valid?
      the_category.save
      redirect_to("/categories/#{the_category.id}", { :notice => "Category updated successfully."} )
    else
      redirect_to("/categories/#{the_category.id}", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.destroy

    redirect_to("/categories", { :notice => "Category deleted successfully."} )
  end
end
