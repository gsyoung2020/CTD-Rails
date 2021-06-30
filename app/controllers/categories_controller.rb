class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
    @user = User.find(session[:user_id])
  end
 

end

