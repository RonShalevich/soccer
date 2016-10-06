class Assignment < ApplicationRecord
  belongs_to :players
  belongs_to :teams
  validates :player_id, uniqueness: { scope: :team_id }
end
