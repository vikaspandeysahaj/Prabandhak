class AddColumnsToExpenses < ActiveRecord::Migration
  def change
    add_reference :expenses, :currency, index: true, foreign_key: true
    add_column :expenses, :billnumber, :string
    add_column :expenses, :isbillable, :boolean
  end
end
