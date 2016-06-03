class AddEmailToWalkerAndOwner < ActiveRecord::Migration
  def change
    add_column :owners, :email, :string
    add_column :walkers, :email, :string
  end
end
