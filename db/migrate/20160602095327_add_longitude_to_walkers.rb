class AddLongitudeToWalkers < ActiveRecord::Migration
  def change
    add_column :walkers, :longitude, :float
  end
end
