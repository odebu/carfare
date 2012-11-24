class Owner < ActiveRecord::Base
  attr_accessible :name

  def self.find_user
  	find(:first, :select => "email")
  end

end
