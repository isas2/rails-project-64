class PopulatePostLikesCount < ActiveRecord::Migration[7.1]
  def up
    Post.find_each do |post|
      Post.reset_counters(post.id, :likes_count)
    end
  end
end
