class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :championship, index: true, foreign_key: true
      t.references :round, index: true, foreign_key: true
      t.integer :goals_home_team
      t.integer :goals_away_team
      t.date :day_of_match
      t.references :home_team, index: true, foreign_key: false
      t.references :away_team, index: true, foreign_key: false

      t.timestamps null: false
    end
    add_foreign_key :matches, :teams, column: :home_team_id, name: 'home_team_id'
    add_foreign_key :matches, :teams, column: :away_team_id, name: 'away_team_id'
  end
end