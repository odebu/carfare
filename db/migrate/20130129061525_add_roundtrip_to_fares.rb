class AddRoundtripToFares < ActiveRecord::Migration
  def change
    add_column :fares, :round_trip, :boolean, :null => false, :default => false
  end
end
