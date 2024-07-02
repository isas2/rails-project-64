# frozen_string_literal: true

class Posts::LikesController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    flash[:error] = like.errors.full_messages.first unless like.save
    redirect_to post_url(like.post_id)
  end

  def destroy
    current_user.likes.find_by(id: params[:id])&.destroy
    redirect_to post_url(params[:post_id])
  end
end
