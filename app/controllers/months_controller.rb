# -*- encoding: utf-8 -*-
class MonthsController < ApplicationController
  http_basic_authenticate_with :name => "sgw", :password => "hogehoge"
  before_filter :authenticate_user! or :authenticate_admin! or :authenticate_accounting!

  def index
    @month = Month.new
    @months = current_user.months.all(:order => "year, month")
    @rejection = current_user.months.find(:all, :conditions => [ "recognition_state = ?", 2])
  end

  def create
    @month = Month.new(params[:month]) 
    @month.user = current_user  
    @month.save
    redirect_to user_root_path
  # render json: { one: @month }
  end
  
  def show
    @month = Month.find(params[:id])
    @fare = Month.find(params[:id]).fares.build
    @fares = Fare.all(:conditions => { :month_id => params[:id]}, :order => "day")
    @fare_sum = Fare.sum(:fare, :conditions => { :month_id => params[:id]})
  end
  
  def edit
    @month = Month.find(params[:id])
  end
  
  def update
    @month = Month.find(params[:id])
    @month.assign_attributes(params[:month])
    if @month.save
      redirect_to action: "index"
    else
      redirect_to action: "edit"
    end
  end
  
  def destroy
    @month = Month.find(params[:id])
    @month.destroy
    render json: { one: @month }
  end

  # 申請用メソッド
  def application
    @month = Month.find(params[:id])
    @month.update_attributes(:recognition_request => true, :recognition_state => 0)  
    redirect_to :back
  end

  # 取り下げ用メソッド
  def withdrawn
    @month = Month.find(params[:id])
    @month.update_attribute(:recognition_request, false)  
    redirect_to :back
  end

end
