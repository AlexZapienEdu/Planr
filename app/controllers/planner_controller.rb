class PlannerController < ApplicationController

 
  def index
    $matching_categories = Category.all
    $list_of_categories = $matching_categories.order({ :created_at => :desc })

    render({ :template => "plan/index.html.erb" })
  #end

  #def plan
    #Random Event Section
    #Takes in the Category Name and matches it to the ID in the Category Table
    input_cat = "Fun" #params.fetch("query_cat1")
    matching_categories1 = Category.where({ :category_name => input_cat}).at(0)
    cat_id = matching_categories1.id

    #Finds how many events are in this category
    matching_category_count = matching_categories1.events_count

    #Returns a random event within this category
    matching_events_with_cat = EventSpot.where({ :category_id => cat_id})
    event_with_cat = matching_events_with_cat.at(rand(matching_category_count))
    event = event_with_cat.event_name

    #########
    
    #Random Dinner Section
    #Takes in the Category Name and matches it to the ID in the Category Table
    input_cat = "Fun" #params.fetch("query_cat1")
    matching_categories1 = Category.where({ :category_name => input_cat}).at(0)
    cat_id = matching_categories1.id

    #Finds how many events are in this category
    matching_category_count = matching_categories1.events_count

    #Returns a random event within this category
    matching_events_with_cat = EventSpot.where({ :category_id => cat_id})
    event_with_cat = matching_events_with_cat.at(rand(matching_category_count))
    event = event_with_cat.event_name
    dessert_cat = params.fetch("query_cat3")
    
  end



end
