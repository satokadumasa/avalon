class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :overview
      t.text :detail

      t.timestamps
    end
  end
end
