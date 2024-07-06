# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    sign_in users(:one)
    @attrs = {
      title: Faker::Lorem.sentence.chomp('.'),
      body: Faker::Lorem.paragraphs.join("\n\n"),
      category_id: categories(:two).id
    }
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
      post posts_url, params: { post: @attrs }
    end

    assert_not_nil Post.find_by(@attrs)
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
    patch post_url(@post), params: { post: @attrs }

    assert_equal Post.find_by(@attrs).id, @post.id
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_nil Post.find_by(id: @post.id)
  end
end
