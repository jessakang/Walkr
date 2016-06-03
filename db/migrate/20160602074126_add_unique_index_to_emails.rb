class AddUniqueIndexToEmails < ActiveRecord::Migration
  def change
    add_index :walkers, :email, unique: true
    add_index :owners, :email, :unique => true
  end
end
