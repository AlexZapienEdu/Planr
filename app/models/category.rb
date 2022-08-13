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
end
