class AddDayToFare < ActiveRecord::Migration
  def change
    add_column :fares, :day, :integer
  end
end
