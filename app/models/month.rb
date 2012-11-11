class Month < ActiveRecord::Base
  belongs_to :owner
  attr_accessible :month, :year
  has_many :fares
end
