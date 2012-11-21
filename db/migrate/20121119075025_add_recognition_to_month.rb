class AddRecognitionToMonth < ActiveRecord::Migration
  def change
    add_column :months, :recognition_request, :boolean
    add_column :months, :recognition_state, :boolean
  end
end
