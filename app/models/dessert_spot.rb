# == Schema Information
#
# Table name: dessert_spots
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
class DessertSpot < ApplicationRecord

  belongs_to(:visitor, { :required => true, :class_name => "User", :foreign_key => "visitor_id" })
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id", :counter_cache => true })

  #Helps find name of visitor of desert spot
  def dess_user
    dessert_visitor_id = self.visitor_id

    matching_people = User.where({ :id => dessert_visitor_id })

    visitor_name = matching_people.at(0)

    return visitor_name
  end

  #Helps find category name of desert spot
  def dess_category
    dessert_cat_id = self.category_id

    matching_cats = Category.where({ :id => dessert_cat_id })

    category_name = matching_cats.at(0)

    return category_name
  end
end
