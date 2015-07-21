class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :description, limit:100
      t.string :full_description, limit:255

      t.timestamps null: false
    end
  end
end
