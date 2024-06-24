# frozen_string_literal: true

require 'test_helper'

class PostCommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post_comment = post_comments(:one)
    sign_in users(:one)
  end

  test 'should create post_comment' do
    assert_difference('PostComment.count') do
      post post_comments_url(@post_comment.post_id), params: { post_comment: { content: @post_comment.content, post_id: @post_comment.post_id, user_id: @post_comment.user_id } }
    end

    assert_redirected_to post_url(@post_comment.post_id)
  end
end
