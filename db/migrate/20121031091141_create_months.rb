class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.integer :year
      t.integer :month
      t.boolean :recognition_request, :null => false, :default => false
      t.integer :recognition_state, :default => 0
      t.references :user

      t.timestamps
    end
    add_index :months, :user_id
  end
end
