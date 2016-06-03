class AddAddressToWalkers < ActiveRecord::Migration
  def change
    add_column :walkers, :address, :string
  end
end
