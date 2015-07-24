module Api
  module V1
    class ApiController < RocketPants::Base
      version 1

      before_action :authenticate!

      private
         def authenticate!
           @user = User.find_by(token:params[:token] ||= 0)
           @user ? true : (error! :unauthenticated)
          #  User.find_by(token:params[:token])? true : (error! :unauthenticated)
         end
    end
  end
end
