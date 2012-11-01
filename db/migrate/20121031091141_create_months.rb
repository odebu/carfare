class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.integer :year
      t.integer :month
      t.references :owner

      t.timestamps
    end
    add_index :months, :owner_id
  end
end
