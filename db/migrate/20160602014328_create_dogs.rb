class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.text :name
      t.text :breed
      t.text :weight
      t.text :suburb
      t.text :concerns
      t.text :image

      t.timestamps null: false
    end
  end
end
