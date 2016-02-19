class ExpensestatusesController < ApplicationController

	def index
		@expensestatuses = Expensestatus.all;
	end

	def new
		@expensestatus = Expensestatus.new
	end

	def edit
		@expensestatus = Expensestatus.find(params[:id])
	end

	def create
		@expensestatus = Expensestatus.new(expensestatus_params)
		if @expensestatus.save
			redirect_to @expensestatus
		else
			render 'new'
		end
	end

	def update
		@expensestatus = Expensestatus.find(params[:id])
		if(@expensestatus.update(expensestatus_params))
			redirect_to @expensestatus
		else
			render 'edit'
		end
	end

	def destroy
    	@expensestatus = Expensestatus.find(params[:id])
    	@expensestatus.destroy
    	redirect_to expensestatuses_path
  	end

 	def show
    	@expensestatus = Expensestatus.find(params[:id])
    end
	private
  		def expensestatus_params
    		params.require(:expensestatus).permit(:title,  :description)
  		end
end
