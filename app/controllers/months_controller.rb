class MonthsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @month = Month.new
    @months = current_user.months.all(:order => "year, month")
  end

  def create
    @month = Month.new(params[:month]) 
    @month.user = current_user  
    @month.save
    redirect_to :months 
  end
  
  def show
    @month = Month.find(params[:id])
    @fare = Month.find(params[:id]).fares.build
    @fares = Fare.all(:conditions => { :month_id => params[:id]}, :order => "day")
  end
  
  def edit
    @month = Month.find(params[:id])
  end
  
  def update
    @month = Month.find(params[:id])
    @month.assign_attributes(params[:month])
    if @month.save
      redirect_to action: "show"
    else
      redirect_to action: "edit"
    end
  end
  
  def destroy
    @month = Month.find(params[:id])
    @month.destroy
    render json: { one: @month }
  end

  def application
    @month = Month.find(params[:id])
    @month.update_attribute(:recognition_request, true)  
    redirect_to :back
  end

  def withdrawn
    @month = Month.find(params[:id])
    @month.update_attribute(:recognition_request, false)  
    redirect_to :back
  end

end
