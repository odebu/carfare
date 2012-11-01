class Owner < ActiveRecord::Base
  attr_accessible :name
  has_many :months
end
