class UsersController < ApplicationController


  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to frontpage_path
    else
      render 'settings/edit'
    end
  end
  private
    def user_params
      params.require(:user).permit(:gender, :avatar, :nickname)
    end
end
