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

  # 交通費チェック用
  def expenses_check
    @month = Month.find(params[:id])
    @fare_show = Fare.find(:all, :conditions => { :month_id => params[:id]}, :order => "day")
    @fare_sum = Fare.sum(:fare, :conditions => { :month_id => params[:id]})
  end

  # 承認用
  def recognition
    @month = Month.find(params[:id])
    @month.update_attribute(:recognition_state, 1)  
    redirect_to :back
  end

  # 差し戻し用
  def rejection
    @month = Month.find(params[:id])
    @month.update_attributes(:recognition_state => 2, :recognition_request => false)  
    redirect_to :back
  end

end
