class CreatePagecommentPages < ActiveRecord::Migration[5.2]
  def change
    create_table :pagecomment_pages do |t|
      t.integer :pagecomment_id
      t.integer :page_id

      t.timestamps
    end
  end
end
