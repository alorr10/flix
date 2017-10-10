class UsersController < ApplicationController

  before_action :find_user, except: [:new, :create, :index]

  before_action :require_signin, except: [:new, :create]

  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @favorites = @user.favorite_movies
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "Account successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Account successfully deleted!"
  end

  private

    def require_correct_user
      unless current_user == @user
        redirect_to root_url
      end
    end

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def require_signin
      unless current_user
        session[:intended_url] = request.url
        redirect_to new_session_url, alert: "Please sign in first!"
      end
    end


end
