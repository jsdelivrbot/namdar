class RemoveColumnTagsArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :article_id, :integer
  end
end
