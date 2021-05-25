class PostController < ApplicationController

  before_action :require_login, only: [:new, :edit, :destory]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(user_id: Current.user.id))
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  private

    def post_params
      params.require(:post).permit(:title, :description)
    end
end
