class AddPasswordDigestToOwnersAndWalkers < ActiveRecord::Migration
  def change
    add_column :owners, :password_digest, :string
    add_column :walkers, :password_digest, :string
  end
end
