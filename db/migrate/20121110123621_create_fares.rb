class CreateFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.integer :day
      t.string :visiting_company
      t.string :visiting_purpose
      t.string :start_station
      t.string :arrival_station
      t.string :vehicle
      t.integer :fare
      t.integer :recipt
      t.references :month
      
      t.timestamps
    end
    add_index :fares, :month_id
  end
end
