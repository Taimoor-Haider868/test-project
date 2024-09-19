class CommentsController < ApplicationController
    before_action :set_post, only: [:create, :destroy]
  
    def create
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user
  
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, alert: 'Comment could not be created.'
      end
    end
  
    def destroy
      @comment = @post.comments.find(params[:id])
      @comment.destroy
      redirect_to @post, notice: 'Comment was successfully deleted.'
    end
  
    private
  
    def set_post
      @post = Post.includes(comments: :user).find(params[:post_id])
    end
  
    def comment_params
      params.require(:comment).permit(:body, :parent_id)
    end
  end
  