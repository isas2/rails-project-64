# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    like = PostLike.new(like_params)

    respond_to do |format|
      unless like.save
        flash[:error] = like.errors.full_messages.first
      end
      format.html { redirect_to post_url(like.post_id) }
    end
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy!

    respond_to do |format|
      format.html { redirect_to post_url(like.post_id) }
    end
  end

  private

  def like_params
    {
      post_id: params.require(:post_id),
      user_id: current_user.id
    }
  end
end
