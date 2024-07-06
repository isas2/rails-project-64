# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @like = post_likes(:one)
    sign_in users(:one)
    @attrs = {
      user_id: users(:one).id,
      post_id: posts(:two).id
    }
  end

  test 'should create like' do
    assert_difference('PostLike.count') do
      post post_likes_url(@attrs[:post_id])
    end

    assert_not_nil PostLike.find_by(@attrs)
  end

  test 'should destroy like' do
    @like = PostLike.create!(@attrs)
    assert_difference('PostLike.count', -1) do
      delete post_like_url(@like.post_id, @like)
    end

    assert_nil PostLike.find_by(id: @like.id)
  end
end
