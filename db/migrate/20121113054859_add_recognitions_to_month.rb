class AddRecognitionsToMonth < ActiveRecord::Migration
  def change
    add_column :months, :recognition_request, :integer
    add_column :months, :recognition_state, :integer
  end
end
