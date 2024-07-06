# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:one)
    @content = Faker::Lorem.sentence.chomp('.')
    @post = posts(:two)
  end

  test 'should create post_comment' do
    assert_difference('PostComment.count') do
      post post_comments_url(@post.id), params: { post_comment: { content: @content } }
    end

    assert_not_nil PostComment.find_by(post_id: @post.id, content: @content)
  end
end
