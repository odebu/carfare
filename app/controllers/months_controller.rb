class MonthsController < ApplicationController

  def create
    @owner = Owner.find(params[:owner_id])
    @month = Owner.find(params[:owner_id]).months.new
    @month.month = params[:month]['month']
    @month.save
    redirect_to owner_path(@owner)
  end

end
