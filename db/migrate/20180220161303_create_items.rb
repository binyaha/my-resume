class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.text :description
      t.string :user_id
      t.timestamps
    end
  end
end
