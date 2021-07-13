class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy, :show]
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # UserMailer.with(user: @user).new_user_email.deliver_later
            session[:user_id] = @user.id
            redirect_to categories_path
        else
            render :new
        end
    end

    def show
        @users = @user.posts.order(:updated_at).page params[:page]

        @comments = @user.comments
    end

    def edit
    end

    def destroy
        Post.where('user_id LIKE ?', session[:user_id]).update_all(user_id: 18)
        Comment.where('user_id LIKE ?', session[:user_id]).update_all(user_id: 18)
        @user.destroy
        respond_to do |format|
          format.html { redirect_to home_path, notice: 'Post was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to user_path(@user.id) , notice: 'user was successfully updated.' }
            format.json { render :show, status: :ok, location: @user}
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def delete_posts
        #byebug
        user_number = params[:format].to_i
        @user = User.find(user_number)
        @user.posts.destroy_all
        @user.comments.destroy_all
        redirect_to categories_path
    end

    private

    def set_user
    @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :id, :email)
    end

end
