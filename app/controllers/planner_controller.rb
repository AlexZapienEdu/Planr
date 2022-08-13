class PlannerController < ApplicationController

 
  def index
    
    render({ :template => "plan/index.html.erb" })
  end

end
