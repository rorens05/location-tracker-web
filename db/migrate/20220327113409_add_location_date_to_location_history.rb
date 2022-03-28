class AddLocationDateToLocationHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :location_histories, :location_date, :datetime
  end
end
