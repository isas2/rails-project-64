# frozen_string_literal: true

json.extract! post_comment, :id, :content, :user_id, :post_id, :ancestry, :created_at, :updated_at
json.url post_comment_url(post_comment, format: :json)
