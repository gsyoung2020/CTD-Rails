class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
   
    def index
        @category=Category.find(params[:category_id])
        @posts = @category.posts
    end

    def show
    end

    def new
        @post = Post.new
        current_user
    end

    def edit
    end
      
    def create
        @post = Post.new(post_params)
        respond_to do |format|
          if @post.save
            format.html { redirect_to action: "index", category_id: @post.category.id , notice: 'Post was successfully created.' }
            format.json { render :show, status: :created, location: @post }
          else
            format.html { render :new }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def update
        respond_to do |format|
          if @post.update(post_params)
            format.html { redirect_to @post, notice: 'Post was successfully updated.' }
            format.json { render :show, status: :ok, location: @post}
          else
            format.html { render :edit }
            format.json { render json: @post.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @post.destroy
        respond_to do |format|
          format.html { redirect_to categories_path, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
    
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :body, :tag, :category_id, :user_id)
      end

      def current_user
        @user = User.find(session[:user_id])
        @user.id
      end

end
