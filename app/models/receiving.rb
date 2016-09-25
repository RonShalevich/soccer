class Receiving < ApplicationRecord
  belongs_to :messages
  belongs_to :user
end
