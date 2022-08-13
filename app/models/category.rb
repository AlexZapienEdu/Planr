# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  category_name       :string
#  dessert_spots_count :integer
#  dinner_spots_count  :integer
#  events_count        :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
class Category < ApplicationRecord

  has_many(:dinner_spots, { :class_name => "DinnerSpot", :foreign_key => "category_id", :dependent => :nullify })
  has_many(:events, { :class_name => "EventSpot", :foreign_key => "category_id", :dependent => :nullify })
  has_many(:dessert_spots, { :class_name => "DessertSpot", :foreign_key => "category_id", :dependent => :nullify })
end
