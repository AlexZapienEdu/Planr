# == Schema Information
#
# Table name: dinner_spots
#
#  id          :integer          not null, primary key
#  desc        :text
#  image       :string
#  loc_name    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  visitor_id  :integer
#
class DinnerSpot < ApplicationRecord

  belongs_to(:visitor, { :class_name => "User", :foreign_key => "visitor_id" })
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id", :counter_cache => true })

  #Helps find name of visitor of dinner spot
  def din_user
    dinner_visitor_id = self.visitor_id

    matching_people = User.where({ :id => dinner_visitor_id })

    visitor_name = matching_people.at(0)

    return visitor_name
  end


  #Helps find category name of dinner spot
  def din_category
    dinner_cat_id = self.category_id

    matching_cats = Category.where({ :id => dinner_cat_id })

    category_name = matching_cats.at(0)

    return category_name
  end



end
