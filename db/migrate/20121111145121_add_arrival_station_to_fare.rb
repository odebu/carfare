class AddArrivalStationToFare < ActiveRecord::Migration
  def change
    add_column :fares, :arrival_station, :string
  end
end
