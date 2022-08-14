class PlannerController < ApplicationController

 
  def index
    $matching_categories = Category.all
    $list_of_categories = $matching_categories.order({ :created_at => :desc })

    render({ :template => "plan/index.html.erb" })
  end

  def plan

    #Random Event Section
    #Takes in the Category Name and matches it to the ID in the Category Table
    input_cat = params.fetch("query_cat1")
    matching_categories1 = Category.where({ :category_name => input_cat}).at(0)
    cat_id = matching_categories1.id

    #Finds how many events are in this category
    matching_category_count = matching_categories1.events_count

    #Returns a random event within this category
    matching_events_with_cat = EventSpot.where({ :category_id => cat_id})
    @event_with_cat = matching_events_with_cat.at(rand(matching_category_count))
    @event = @event_with_cat.event_name

    #########

    #Random Dinner Section
    #Takes in the Category Name and matches it to the ID in the Category Table
    input_cat2 = params.fetch("query_cat2")
    matching_categories2 = Category.where({ :category_name => input_cat2}).at(0)
    cat_id2 = matching_categories2.id

    #Finds how many dinner spots are in this category
    matching_category_count2 = matching_categories2.dinner_spots_count

    #Returns a random dinner spot within this category
    matching_dinner_spots_with_cat = DinnerSpot.where({ :category_id => cat_id2})
    @dinner_with_cat = matching_dinner_spots_with_cat.at(rand(matching_category_count2))
    @dinner = @dinner_with_cat.loc_name

    #########

    #Random Dessert Section
    #Takes in the Category Name and matches it to the ID in the Category Table
    input_cat3 = params.fetch("query_cat3")
    matching_categories3 = Category.where({ :category_name => input_cat3}).at(0)
    cat_id3 = matching_categories3.id

    #Finds how many dinner spots are in this category
    matching_category_count3 = matching_categories3.dessert_spots_count

    #Returns a random event within this category
    matching_dessert_spots_with_cat = DessertSpot.where({ :category_id => cat_id3})
    @dessert_with_cat = matching_dessert_spots_with_cat.at(rand(matching_category_count3))
    @dessert = @dessert_with_cat.loc_name

    render({ :template => "plan/planned.html.erb" })
  end



end
