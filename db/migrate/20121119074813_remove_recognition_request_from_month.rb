class RemoveRecognitionRequestFromMonth < ActiveRecord::Migration
  def up
    remove_column :months, :recognition_request
    remove_column :months, :recognition_state
  end

  def down
    add_column :months, :recognition_state, :integer
    add_column :months, :recognition_request, :integer
  end
end
