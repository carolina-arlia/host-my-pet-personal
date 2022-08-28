class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_checkin
      t.date :date_checkout
      t.integer :guests
      t.boolean :confirmed

      t.timestamps
    end
  end
end
