class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :distance, index: true
      t.integer :user_id,  index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
