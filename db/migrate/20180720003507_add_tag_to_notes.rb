class AddTagToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :tag, :text
  end
end
