class Api::V1::PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def create
    poster = User.find(params[:poster_id])
    receiver = User.find(params[:receiver_id])
    post = Post.create({
      content: params[:content],
      poster: poster,
      receiver: receiver
    })
    render json: Post.all
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: Post.all
  end

  private

  def post_params
    params.permit(:content)
  end
end
