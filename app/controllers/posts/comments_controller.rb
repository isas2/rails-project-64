# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @post_comment = PostComment.new(comment_params)
    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to post_url(@post_comment.post_id), notice: t('.success') }
      else
        flash[:error] = @post_comment.errors.full_messages.join(', ')
        format.html { redirect_to post_url(@post_comment.post_id) }
      end
    end
  end

  private

  def comment_params
    data = params.require(:post_comment).permit(:content, :ancestry)
    updates = {
      parent: PostComment.find_by(id: data.delete(:ancestry)),
      post_id: params.require(:post_id),
      user_id: current_user.id
    }
    data.merge(updates)
  end
end
