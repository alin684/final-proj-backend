module Api
  module V1
    class FriendsController < ApplicationController

      def friends_list
        user = User.find(params[:id])
        render json: user.friends
      end

      def requested_friends_list
        user = User.find(params[:id])
        render json: user.requested_friends
      end

      def pending_friends_list
        user = User.find(params[:id])
        render json: user.pending_friends
      end

      def send_friend_request
        user_sender = User.find(params[:sender_id])
        user_acceptor = User.find(params[:acceptor_id])
        user_sender.friend_request(user_acceptor)
        render json: user_sender.pending_friends
      end

      def accept_friend_request
        user_sender = User.find(params[:sender_id])
        user_acceptor = User.find(params[:acceptor_id])
        user_acceptor.accept_request(user_sender)
        render json: user_acceptor.requested_friends
      end

      def destroy
        user_remover = User.find(params[:remover_id])
        user_removed = User.find(params[:removed_id])
        user_remover.remove_friend(user_removed)
        render json: user_remover.friends
      end

    end

  end
end
