# -*- encoding: utf-8 -*-
class AccountingsController < ApplicationController
  http_basic_authenticate_with :name => "sgw", :password => "hogehoge"
  before_filter :authenticate_accounting!

  def index
  	@user_info = User.find_user
    @recognition = Month.find_fare_for_recognition
    @authorize = Month.find_authorize_fare
    @rejection = Month.find_rejection_fare
  end

end
