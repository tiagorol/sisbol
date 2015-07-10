class CreateChampionships < ActiveRecord::Migration
  def change
    create_table :championships do |t|
      t.string :name, null: false
      t.date :start, null: false
      t.date :end, null: false

      t.timestamps null: false
    end
  end
end
