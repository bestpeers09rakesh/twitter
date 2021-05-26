class HomeController < ApplicationController
  helper HomeHelper
  before_action :require_login, only: [:user_tweet, :create_comment, :like_post, :unlike, :like, :follow, :unfollow, :user_follow]

  def index
    @comment = Comment.new
    # byebug
    @all_tweet = Post.all.order('id desc')
  end

  def user_tweet
    @comment = Comment.new
    @user_tweet = Post.where(user_id: Current.user.id).order('id desc')
  end

  def create_comment
    @comment = Comment.new(params_comment.merge(user_id: Current.user.id, post_id: params[:id]))
    if @comment.save
      redirect_to root_path
    else
      @all_tweet = Post.all.order('id desc')
      render :index
    end
  end

  def like_post
    @comment = Comment.new
    @like_post = Like.where(user_id: Current.user.id)
  end

  def user_follow
    
  end

  def like
    Like.create(user_id: Current.user.id, post_id: params[:id])
    count = Like.where(post_id: params[:id]).count
    respond_to do |format|
      # format.html { redirect_to root_path}
      # format.js
      format.json { render json: count}

    end
  end

  def unlike
    Like.find_by(user_id: Current.user.id, post_id: params[:id]).destroy
    count = Like.where(post_id: params[:id]).count
    respond_to do |format|
      # format.html {redirect_to root_path}
      format.json {render json: count}
    end
  end

  def follow
    Follow.create(follower_id:Current.user.id, followed_id:params[:id])
    redirect_to root_path
  end

  def unfollow
    Follow.find_by(follower_id:Current.user.id, followed_id:params[:id]).destroy
    redirect_to root_path
  end

  private

    def params_comment
      params.require(:comment).permit(:description)
    end
end
