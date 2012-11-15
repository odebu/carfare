class Month < ActiveRecord::Base
  belongs_to :owner
  attr_accessible :month, :year, :recognition_request, :recognition_state
  has_many :fares

  def self.find_fare_for_recognition
  	find(:all)
  end

end
