# -*- encoding: utf-8 -*-
class RecognitionsController < ApplicationController
  http_basic_authenticate_with :name => "sgw", :password => "hogehoge"
  before_filter :authenticate_admin!  

  def index
  	@user_info = User.find_user
    @recognition = Month.find_fare_for_recognition
    @authorize = Month.find_authorize_fare
    @rejection = Month.find_rejection_fare
  end

  def show
  	@recognition = Month.find_fare_for_recognition
  	@fare_show = Fare.find_fare_for_show
  end

  def expenses_check
    @month = Month.find(params[:id])
    @fare_show = Fare.find(:all, :conditions => { :month_id => params[:id]}, :order => "day")
  end

  def recognition
    @month = Month.find(params[:id])
    @month.update_attribute(:recognition_state, 1)  
    redirect_to :back
  end

  def rejection
    @month = Month.find(params[:id])
    @month.update_attributes(:recognition_state => 2, :recognition_request => false)  
    redirect_to :back
  end

end
