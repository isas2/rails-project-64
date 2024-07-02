# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post_comment = post_comments(:one)
    sign_in users(:one)
    @attrs = {
      content: Faker::Lorem.sentence.chomp('.'),
      post_id: posts(:two).id
    }
  end

  test 'should create post_comment' do
    assert_difference('PostComment.count') do
      post post_comments_url(@attrs[:post_id]), params: { post_comment: @attrs }
    end

    assert_not_nil PostComment.find_by(@attrs)
  end
end
