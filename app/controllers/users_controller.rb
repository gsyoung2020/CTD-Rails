class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]
    
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
        @user = User.find(params[:id]) 
        @users = @user.posts

        @comments = @user.comments
    end

    def edit
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

    private

    def set_user
    @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password, :id, :email)
    end

end
