# frozen_string_literal: true

class Posts::CommentsController < Posts::ApplicationController
  before_action :authenticate_user!

  def create
    @post_comment = current_user.comments.build(comment_params)
    if @post_comment.save
      redirect_to post_url(@post_comment.post_id), notice: t('.success')
    else
      flash[:error] = @post_comment.errors.full_messages.join(', ')
      redirect_to post_url(@post_comment.post_id)
    end
  end

  private

  def comment_params
    data = params.require(:post_comment).permit(:content, :parent_id)
    data.merge(post_id: params[:post_id])
  end
end
