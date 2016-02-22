class ExpensesController < ApplicationController
	def index
		if (current_user.is? :admin)
			@expenses = Expense.all
		else
			@expenses = current_user.expenses
		end
	end

	def new
		@expense = Expense.new
	end

	def edit
		@expense = Expense.find(params[:id])
	end

	def create
		@expense = Expense.new(expense_params)
		if (current_user.is? :default)
			@expense.user_id = current_user.id
			@expense.expensestatus_id = Expensestatus.first.id
		end

		if @expense.save
			redirect_to @expense
		else
			render 'new'
		end
	end

	def update
		@expense = Expense.find(params[:id])
		if(@expense.update(expense_params))
			redirect_to @expense
		else
			render 'edit'
		end
	end

	def destroy
    	@expense = Expense.find(params[:id])
    	@expense.destroy
    	redirect_to expenses_path
  	end

 	def show
 		if (current_user.is? :admin)
    		@expense = Expense.find(params[:id])
    	else
			@expense = current_user.expenses.find(params[:id])
		end
    end
    
	private
  		def expense_params
    		params.require(:expense).permit(:vendor, :amount,  :description, :tag, :expensedate, :user_id, :project_id, :expensestatus_id, :expensetype_id)
  		end
end
