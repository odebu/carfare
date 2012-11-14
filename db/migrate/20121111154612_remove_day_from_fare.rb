class RemoveDayFromFare < ActiveRecord::Migration
  def up
    remove_column :fares, :day
  end

  def down
    add_column :fares, :day, :date
  end
end
