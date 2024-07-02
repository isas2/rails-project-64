class AddPostLikeIndex < ActiveRecord::Migration[7.1]
  def change
    add_index :post_likes, %i[user_id post_id], unique: true
  end
end
