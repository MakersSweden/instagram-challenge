class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index]

  def new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    flash[:notice] = 'Post Liked!'
    redirect_to posts_path
  end
end