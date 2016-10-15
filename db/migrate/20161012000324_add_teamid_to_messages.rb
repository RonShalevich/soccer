class AddTeamidToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :team, foreign_key: true
  end
end
