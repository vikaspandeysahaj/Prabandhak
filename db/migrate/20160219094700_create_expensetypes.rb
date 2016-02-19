class CreateExpensetypes < ActiveRecord::Migration
  def change
    create_table :expensetypes do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
