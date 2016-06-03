class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.text :name
      t.text :image

      t.timestamps null: false
    end
  end
end
