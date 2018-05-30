class CreateUserPagecomments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_pagecomments do |t|
      t.integer :user_id
      t.integer :pagecomment_id

      t.timestamps
    end
  end
end
