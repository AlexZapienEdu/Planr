class PlannerController < ApplicationController

 
  def index
    $matching_categories = Category.all
    $list_of_categories = $matching_categories.order({ :created_at => :desc })

    render({ :template => "plan/index.html.erb" })
  end

end
