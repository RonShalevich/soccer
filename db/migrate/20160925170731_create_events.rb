class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :type
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.string :duties
      t.string :team_id

      t.timestamps
    end
  end
end
