class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.string :location
      t.float :price_per_night

      t.timestamps
    end
  end
end
