class Match < ActiveRecord::Base
  belongs_to :championship
  belongs_to :round
  belongs_to :home_team, :class_name => 'Team', :foreign_key =>  'home_team_id'
  belongs_to :away_team, :class_name => 'Team', :foreign_key =>  'away_team_id'
  validates :championship, presence: true
  validates :round, presence: true
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates_numericality_of :goals_home_team, greater_than_or_equal_to: 0
  validates_numericality_of :goals_away_team, greater_than_or_equal_to: 0
  validate :validate_teams
  validate :championship_has_round

  private
  def validate_teams
    errors[:base] << I18n.translate(:message_validate_distinct_teams) if self.home_team_id.equal?(self.away_team_id)
  end

  def championship_has_round
    errors[:base] << I18n.translate(:message_validate_championship_has_round) unless self.round and self.championship_id and self.round.championship_id.equal?(self.championship_id)
  end
end
