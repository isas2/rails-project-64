class SetPostCommentsContentNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :post_comments, :content, false
  end
end
