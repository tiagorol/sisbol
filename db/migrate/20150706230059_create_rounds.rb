class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.string :name, limit: 20, null: false

      t.timestamps null: false
    end
  end
end
