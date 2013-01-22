# -*- encoding: utf-8 -*-
class AdminWelcomeController < ApplicationController
  def index
    if current_admin  
      redirect_to :admin_root  
    return  
    end  
  end
end
