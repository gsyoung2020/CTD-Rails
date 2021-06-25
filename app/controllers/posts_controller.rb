class PostsController < ApplicationController
    
    def index
        @category=Category.find(params[:category_id])
        @posts = @category.posts
    end

    def show
        @post = Post.find(params[:id])
    end

end
