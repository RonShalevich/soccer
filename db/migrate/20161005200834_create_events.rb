class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :game
      t.datetime :start_time

      t.timestamps
    end
  end
end
