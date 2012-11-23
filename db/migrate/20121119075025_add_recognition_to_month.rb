class AddRecognitionToMonth < ActiveRecord::Migration
  def change
    add_column :months, :recognition_request, :boolean, :null => false, :default => false
    add_column :months, :recognition_state, :boolean, :null => false, :default => false
  end
end
