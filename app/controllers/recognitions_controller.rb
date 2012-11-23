class RecognitionsController < ApplicationController
  def index
  	@owner_info = Owner.find_owner
    @recognition = Month.find_fare_for_recognition
  end

  def show
  	@recognition = Month.find_fare_for_recognition
  	@fare_show = Fare.find_fare_for_show
  end

  def expenses_check
    @month = Month.find(params[:id])
    @fare_show = Fare.find(:all, :conditions => { :month_id => params[:id]}, :order => "day")
  end

end
