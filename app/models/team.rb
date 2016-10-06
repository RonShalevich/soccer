class Team < ApplicationRecord
  belongs_to :users
  has_many   :managings, dependent: :destroy
  has_many   :users, through: :managings

  has_many   :players, dependent: :destroy
  has_many   :assignments, dependent: :destroy
  has_many   :assigned_players, through: :assignments, source: :player

  validates  :name, presence: true
end
