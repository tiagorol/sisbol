class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.datetime :date, null: false
      t.references :user, index: true, foreign_key: true, null: false
    end
  end
end
