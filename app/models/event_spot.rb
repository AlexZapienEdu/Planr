# == Schema Information
#
# Table name: event_spots
#
#  id          :integer          not null, primary key
#  desc        :text
#  event_name  :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  visitor_id  :integer
#
class EventSpot < ApplicationRecord

  belongs_to(:visitor, { :required => true, :class_name => "User", :foreign_key => "visitor_id" })
  belongs_to(:category, { :required => true, :class_name => "Category", :foreign_key => "category_id", :counter_cache => :events_count })


  def event_visitor
    event_visitor_id = self.visitor_id

    matching_people = User.where({ :id => event_visitor_id })

    visitor_name = matching_people.at(0)

    return visitor_name
  end

  def event_category
    event_cat_id = self.category_id

    matching_cats = Category.where({ :id => event_cat_id })

    category_name = matching_cats.at(0)

    return category_name
  end
end
