class Team < ApplicationRecord
  belongs_to :users
  has_many   :managings, dependent: :destroy
  has_many   :users, through: :managings

  has_many   :players, dependent: :destroy

  validates  :name, presence: true
end
