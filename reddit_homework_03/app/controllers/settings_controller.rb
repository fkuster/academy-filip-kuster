class SettingsController < ApplicationController
  def edit
    @user = User.find(current_user.id)
    @subscriptions = @user.subscriptions
  end
end
