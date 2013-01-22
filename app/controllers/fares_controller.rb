# -*- encoding: utf-8 -*-
class FaresController < ApplicationController
  http_basic_authenticate_with :name => "sgw", :password => "hogehoge"
  before_filter :authenticate_user!

  def create
    @month = Month.find(params[:month_id])
    @fare = Month.find(params[:month_id]).fares.create(params[:fare])
    redirect_to month_path(@month)
  end

  def show
    @month = Month.find(params[:month_id])
    @fare = Fare.find(params[:id])
  end

  def edit
    @month = Month.find(params[:month_id])
    @fare = Fare.find(params[:id])
  end

  def update
    @fare = Fare.find(params[:id])
    @fare.assign_attributes(params[:fare])
    if @fare.save
      redirect_to month_path(@fare.month_id)
    else
      redirect_to month_path
    end
  end

  def destroy
    @fare = Fare.find(params[:id])
    @fare.destroy
    render json: { one: @fare }
  end

end
