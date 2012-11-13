class Owner < ActiveRecord::Base
  attr_accessible :name
  has_many :months

  def self.find_owner
  	find(:all)
  end

end
