# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password


  has_many(:dinner_spots, { :class_name => "DinnerSpot", :foreign_key => "visitor_id", :dependent => :destroy })
  has_many(:events, { :class_name => "EventSpot", :foreign_key => "visitor_id", :dependent => :destroy })
  has_many(:dessert_spots, { :class_name => "DessertSpot", :foreign_key => "visitor_id", :dependent => :destroy })
end
