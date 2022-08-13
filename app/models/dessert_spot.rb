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
end
