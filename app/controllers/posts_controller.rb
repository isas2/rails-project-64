# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy edit new update]
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = Post.includes(:creator).order(created_at: :desc)
  end

  def show
    @post = Post.includes(:category, :creator).find(params[:id])
    @like = current_user.likes.find_by(post_id: @post.id)
    @post_comments = PostComment.includes(:user).where(post_id: params[:id])
                                .order(created_at: :desc).arrange
    @post_comment = @post.comments.build
  end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    post = current_user.posts.build(post_params)

    if post.save
      redirect_to post_url(post), notice: t('.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.posts.find(params[:id])&.update(post_params)
      redirect_to post_url(@post), notice: t('.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.posts.find(params[:id])&.destroy
    redirect_to root_url, notice: t('.success')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
