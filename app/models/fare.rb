class Fare < ActiveRecord::Base
  belongs_to :month
  attr_accessible :arrival_station, :day, :fare, :recipt, :start_station, :vehicle, :visiting_company

  def self.find_fare_for_show
  	find(:all)
  end

end
