class CreateContacks < ActiveRecord::Migration[5.1]
  def change
    create_table :contacks do |t|
      t.string :sentence
      t.integer :user_id
      t.integer :contack_id
      t.timestamps
    end
  end
end
