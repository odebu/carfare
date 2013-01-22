# -*- encoding: utf-8 -*-
class AccountingWelcomeController < ApplicationController
  def index
  	if current_accounting  
      redirect_to :accounting_root  
    return  
    end  
  end
end
