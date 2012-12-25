class Fare < ActiveRecord::Base
  belongs_to :month
  attr_accessible :arrival_station, :day, :fare, :recipt, :start_station, :vehicle, :visiting_company

  validates :day, :presence => true,
                  :numericality => {:only_integer => true, :less_than => 32}
  validates :fare, :presence => true
  validates :visiting_company, :presence => true

  def self.find_fare_for_show
  	find(:all)
  end

end
