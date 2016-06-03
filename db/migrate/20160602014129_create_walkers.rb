class CreateWalkers < ActiveRecord::Migration
  def change
    create_table :walkers do |t|
      t.text :name
      t.text :experience
      t.text :suburbs
      t.boolean :car
      t.text :wage
      t.text :image

      t.timestamps null: false
    end
  end
end
