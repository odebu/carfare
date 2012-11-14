class FaresController < ApplicationController

  def create
  	@owner = Month.find(params[:owner_id])
    @month = Month.find(params[:month_id])
    @fare = Month.find(params[:month_id]).fares.create(params[:fare])
    redirect_to owner_month_path(@owner, @month)
  end

  def show
    @owner = Owner.find(params[:owner_id])
    @month = Month.find(params[:month_id])
    @fare = Fare.find(params[:id])
  end

  def destroy
    @fare = Fare.find(params[:id])
    @fare.destroy
    render json: { one: @fare }
  end

end
