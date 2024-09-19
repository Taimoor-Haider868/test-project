class PostsController < ApplicationController
  def index
    if params[:query].present?
      @posts = Post.joins(:user).where("posts.title ILIKE ? OR posts.body ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @posts = Post.includes(:user).all
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id;
    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: 'Post was successfully updated.'
    else
      render :edit ,status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :cover_image)
  end
end

