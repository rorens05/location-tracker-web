class CreateLocationHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :location_histories do |t|
      t.references :tracker, null: false, foreign_key: true
      t.string :latlong

      t.timestamps
    end
  end
end
