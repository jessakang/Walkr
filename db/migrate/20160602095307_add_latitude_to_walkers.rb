class AddLatitudeToWalkers < ActiveRecord::Migration
  def change
    add_column :walkers, :latitude, :float
  end
end
