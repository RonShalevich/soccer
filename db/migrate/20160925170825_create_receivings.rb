class CreateReceivings < ActiveRecord::Migration[5.0]
  def change
    create_table :receivings do |t|
      t.references :messages, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
