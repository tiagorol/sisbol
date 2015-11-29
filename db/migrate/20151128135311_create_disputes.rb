class CreateDisputes < ActiveRecord::Migration
  def change
    create_table :disputes do |t|
      t.string :description, :limit => 60, null: false
      t.integer :status, :default => 0, null: false
      t.references :championship, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
