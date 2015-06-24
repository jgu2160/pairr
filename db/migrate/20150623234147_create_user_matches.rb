class CreateUserMatches < ActiveRecord::Migration
  def change
    create_table :user_matches do |t|
      t.integer :user_1
      t.integer :user_2
      t.integer :user_1_choice
      t.integer :user_2_choice

      t.timestamps null: false
    end
  end
end
