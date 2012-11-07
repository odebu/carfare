class MonthsController < ApplicationController

  def create
    @owner = Owner.find(params[:owner_id])
    @month = Owner.find(params[:owner_id]).months.create(params[:month])
    redirect_to owner_path(@owner)
  end
  
  def show
    @owner = Owner.find(params[:owner_id])
    @month = Month.find(params[:id])
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
  

end
