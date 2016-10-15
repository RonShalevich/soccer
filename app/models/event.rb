class Event < ApplicationRecord
  belongs_to :team

  validates :game, presence: true
  validates :start_time, presence: true
end
