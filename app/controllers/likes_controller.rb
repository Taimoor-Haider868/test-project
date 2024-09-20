class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.new(user: current_user)
    if @like.save
      redirect_to @post, notice: 'You liked this post.'
    else
      redirect_to @post, alert: 'Unable to like post.'
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)
    @like.destroy if @like
    redirect_to @post, notice: 'You unliked this post.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
