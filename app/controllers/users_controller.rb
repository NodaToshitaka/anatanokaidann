class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @stories = @user.books.order(created_at: :DESC)
  end

  def index
    @users = User.all.order(created_at: :DESC)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) unless current_user == @user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  def delete
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "Thanyou for using this site ！"
    redirect_to root_path
  end
  
  def confirm_delete
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
