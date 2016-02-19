class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :expensestatus
  belongs_to :expensetype
end
