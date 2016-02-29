class ExpensesController < ApplicationController
	def index
		if (current_user.is? :admin)
			if(params[:expense]!= nil)
				where = {}
				where[:project_id] = params[:expense][:project_id] if params[:expense][:project_id].present?
				where[:currency_id] = params[:expense][:currency_id] if params[:expense][:currency_id].present?
				where[:expensetype_id] = params[:expense][:expensetype_id] if params[:expense][:expensetype_id].present?
				where[:user_id] = params[:expense][:user_id] if params[:expense][:user_id].present?
				where[:expensestatus_id] = params[:expense][:expensestatus_id] if params[:expense][:expensestatus_id].present?
				if((params[:expense][:isbillable].present?)&&(params[:expense][:isbillable]!='-1'))
					where[:isbillable] = params[:expense][:isbillable]
				end
				if((params[:expense][:fromdate].present?)&&(params[:expense][:todate].present?))
					where[:expensedate] = params[:expense][:fromdate]..params[:expense][:todate]
				end

				@expenses = Expense.where(where).paginate(page: params[:page], per_page: 5)
			else
				@expenses = Expense.all.paginate(page: params[:page], per_page: 5)
			end
		else
			if(params[:expense]!= nil)
				where = {}
				where[:project_id] = params[:expense][:project_id] if params[:expense][:project_id].present?
				where[:currency_id] = params[:expense][:currency_id] if params[:expense][:currency_id].present?
				where[:expensetype_id] = params[:expense][:expensetype_id] if params[:expense][:expensetype_id].present?
				where[:expensestatus_id] = params[:expense][:expensestatus_id] if params[:expense][:expensestatus_id].present?
				if((params[:expense][:isbillable].present?)&&(params[:expense][:isbillable]!='-1'))
					where[:isbillable] = params[:expense][:isbillable]
				end
				if((params[:expense][:fromdate].present?)&&(params[:expense][:todate].present?))
					where[:expensedate] = params[:expense][:fromdate]..params[:expense][:todate]
				end

				@expenses = current_user.expenses.where(where).paginate(page: params[:page], per_page: 5)
			else
				@expenses = current_user.expenses.paginate(page: params[:page], per_page: 5)
			end
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
		
		respond_to do |format|
			if @expense.save
				format.json { head :no_content }
	        	format.js
			else
				render 'new'
			end
		end
	end

	def update
		@expense = Expense.find(params[:id])
		respond_to do |format|
			if(@expense.update(expense_params))
				format.json { head :no_content }
	        	format.js
			else
				render 'edit'
			end
		end
	end

	def destroy
    	@expense = Expense.find(params[:id])
    	@expense.destroy
  	end

 	def show
 		@expense = Expense.find(params[:id])
    end
    
	private
  		def expense_params
    		params.require(:expense).permit(:vendor, :amount,  :description, :tag, :expensedate, 
    			:user_id, :project_id, :expensestatus_id, :expensetype_id, :billnumber, :isbillable, :currency_id)
  		end
end
