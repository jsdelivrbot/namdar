class AddColumnArticlesMarkdown < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :markdown, :boolean, default: true
  end
end
