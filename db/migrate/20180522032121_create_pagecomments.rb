class CreatePagecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :pagecomments do |t|
      t.string :title
      t.text :detail

      t.timestamps
    end
  end
end
