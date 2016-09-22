class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, limit: 40
      t.string :password
      t.string :email
      t.string :group

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
