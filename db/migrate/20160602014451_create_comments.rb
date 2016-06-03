class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.text :walker_id
      t.text :owner_id

      t.timestamps null: false
    end
  end
end
