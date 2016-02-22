class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :vendor
      t.float :amount
      t.text :description
      t.text :tag
      t.date :expensedate
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.references :expensestatus, index: true, foreign_key: true
      t.references :expensetype, index: true, foreign_key: true
     
      t.timestamps null: false
    end
  end
end
