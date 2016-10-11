class AddDefaultValueToCommentCount < ActiveRecord::Migration[5.0]
  def change
    change_column :articles, :comments_count, :integer, default: 0
  end
end
