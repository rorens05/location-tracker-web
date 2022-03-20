class CreateTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :trackers do |t|
      t.string :name
      t.text :description
      t.string :reference_number

      t.timestamps
    end
  end
end
