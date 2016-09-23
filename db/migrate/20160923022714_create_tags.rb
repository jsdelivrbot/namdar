class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name, limit: 30
      t.references :article, foreign_key: true

      t.timestamps
    end
    add_index :tags, :name, unique: true
  end
end
