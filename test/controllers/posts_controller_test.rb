# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    sign_in users(:one)
    @attrs = categories(:two, :three).map do |cat|
      {
        title: Faker::Lorem.sentence.chomp('.'),
        body: Faker::Lorem.paragraphs.join("\n\n"),
        category_id: cat.id
      }
    end
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: @attrs.first }
    end

    assert_not_nil Post.find_by(@attrs.first)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    post_for_update = Post.create!(@attrs.first.merge(creator_id: users(:one).id))
    patch post_url(post_for_update), params: { post: @attrs.second }

    created_post = Post.find_by(@attrs.second)
    assert_equal created_post.id, post_for_update.id
  end

  test 'should destroy post' do
    post_for_delete = Post.create!(@attrs.first.merge(creator_id: users(:one).id))
    assert_difference('Post.count', -1) do
      delete post_url(post_for_delete)
    end

    assert_nil Post.find_by(id: post_for_delete.id)
  end
end
