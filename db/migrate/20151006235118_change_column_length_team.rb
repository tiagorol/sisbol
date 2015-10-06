class ChangeColumnLengthTeam < ActiveRecord::Migration
  def change
    change_column :teams, :description, :string, :limit => 60, null: false
    change_column :teams, :full_description, :string, :limit => 100, null: false
  end
end
