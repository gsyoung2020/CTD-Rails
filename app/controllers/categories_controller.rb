class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @choose_posts = Post.new
  end
end
