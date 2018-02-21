class CreateWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :works do |t|
      t.string :project_name
      t.string :photo
      t.string :description
      t.string :src
      t.string :git_src
      t.timestamps
    end
  end
end
