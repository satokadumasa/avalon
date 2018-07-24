class AddTagToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :tag, :text
  end
end
