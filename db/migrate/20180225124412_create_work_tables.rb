class CreateWorkTables < ActiveRecord::Migration[5.1]
  def change
    create_table :work_tables do |t|

      t.integer :user_id
      t.integer :work_id

      t.timestamps
    end
  end
end
