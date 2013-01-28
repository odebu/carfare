# -*- encoding: utf-8 -*-
class OwnersController < ApplicationController 
  def index
    @owner = Owner.all
  end
  
  def new
    @owner = Owner.new()
  end
  
  def create
    @owner = Owner.new(params[:owner])
    if @owner.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end
  
  def show
    @owner = Owner.find(params[:id])
    @month = Owner.find(params[:id]).months.build
  end
  
  def edit
    @owner = Owner.find(params[:id])
  end
  
  def update
    @owner = Owner.find(params[:id])
    @owner.assign_attributes(params[:owner])
    if @owner.save
      redirect_to action: "index"
    else
      redirect_to action: "edit"
    end
  end
  
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    render json: { owner: @owner }
  end

end
