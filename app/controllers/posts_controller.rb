class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def new
    @category = Category.find(params[:category_id])
    # @post = @category.posts.new
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.create(post_params)
    redirect_to category_post_path(@category, @post)
  end

  def destroy
    @post = Post.find(params[:id])
    @category = @post.category
    @post.destroy
    redirect_to category_path(@category)
  end

  def edit
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def update
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to category_post_path(@category, @post)
  end

  private
    def post_params
      params.require(:post).permit(:user_id, :title, :body)
    end

end
