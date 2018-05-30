class CreateNotePages < ActiveRecord::Migration[5.2]
  def change
    create_table :note_pages do |t|
      t.integer :note_id
      t.integer :page_id

      t.timestamps
    end
  end
end
