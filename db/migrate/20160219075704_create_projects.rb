class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.boolean :isBillable
      t.text :description

      t.timestamps null: false
    end
  end
end
