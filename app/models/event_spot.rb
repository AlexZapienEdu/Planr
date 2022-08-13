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
end
