class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :pref_code
      t.string :postal_code
      t.string :address
      t.text :self_introduction

      t.timestamps
    end
  end
end
