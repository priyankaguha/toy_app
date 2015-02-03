class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user, notice: "User is successfully updated."
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: 'User is successfully destroyed.'

  end


  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
