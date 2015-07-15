class CreateClubes < ActiveRecord::Migration
  def change
    create_table :clubes do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
