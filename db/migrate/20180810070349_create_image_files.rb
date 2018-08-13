class CreateImageFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :image_files do |t|
      t.integer :user_id
      t.string :file_name
      t.text :comment

      t.timestamps
    end
  end
end
