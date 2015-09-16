class ChangeColumnLengthUser < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, :limit => 30, null: false
    change_column :users, :surname, :string, :limit => 30, null: false
    change_column :users, :date_of_birth, :date, null: false
    change_column :users, :email, :string, :limit => 50,  null: false
    change_column :users, :password, :string, :limit => 50,  null: false
  end
end
