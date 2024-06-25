# frozen_string_literal: true

require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @like = post_likes(:one)
    sign_in users(:one)
  end

  test 'should create like' do
    assert_difference('PostLike.count') do
      post post_likes_url(@like.post_id), params: { like: { user_id: @like.user_id, post_id: @like.post_id } }
    end

    assert_redirected_to post_url(@like.post_id)
  end

  test 'should destroy like' do
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@like.post_id, @like)
    end

    assert_redirected_to post_url(@like.post_id)
  end
end
