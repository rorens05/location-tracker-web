class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  layout :custom_layout

  def index;
    # redirect_to admin_dashboard_path
  end

  def faq

  end

  private 

  def custom_layout 
    if action_name == 'index'
       'dashboard'  
    else
       'application'
    end
  end
end
