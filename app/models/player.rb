class Player < ApplicationRecord
  belongs_to :team

   mount_uploader :avatar, AvatarUploader

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".squeeze(' ').strip.titleize
  end
end
