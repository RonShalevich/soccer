class Team < ApplicationRecord
  belongs_to :users
  has_many   :managings, dependent: :destroy
  has_many   :users, through: :managings

  has_many   :players, dependent: :destroy
  has_many   :events, dependent: :destroy

  validates  :name, presence: true

  def team_name
    "#{name}".squeeze(' ').strip.titleize
  end

end
