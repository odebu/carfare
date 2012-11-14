class RemoveStationFromFare < ActiveRecord::Migration
  def up
    remove_column :fares, :station
    remove_column :fares, :arrival
  end

  def down
    add_column :fares, :arrival, :string
    add_column :fares, :station, :string
  end
end
