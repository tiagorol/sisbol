class AddRoundRefToChampionships < ActiveRecord::Migration
  def change
    add_reference :rounds, :championship, null:false, index: true, foreign_key: true
  end
end
