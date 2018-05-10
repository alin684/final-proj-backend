module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.all
      end

      def create
        user = User.new(user_params)
        if user.save
          created_jwt = issue_token({id: user.id})
          render json: {message: "User was created!", status: 201, user: user, jwt: created_jwt}
        else
          render json: {
            error: 'Please try again.'
          }, status: 404
        end
      end

      def upload_photo
        user = User.find(params[:id])
        if params[:profile_pic]
          user.update(profile_pic: params[:profile_pic])
          render json: User.all
        elsif params[:cover_photo]
          user.update(cover_photo: params[:cover_photo])
          render json: User.all
        end
      end

      private

      def user_params
        params.permit(:first_name, :last_name, :email, :password, :profile_pic, :cover_photo)
      end

    end

  end
end
