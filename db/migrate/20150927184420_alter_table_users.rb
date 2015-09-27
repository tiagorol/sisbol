class AlterTableUsers < ActiveRecord::Migration
  def change
    add_index :users, :email, :unique => true
    remove_column :users, :password_digest
  end
end
