class CreateManagings < ActiveRecord::Migration[5.0]
  def change
    create_table :managings do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
