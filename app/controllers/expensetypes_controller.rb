class ExpensetypesController < ApplicationController
	def index
		@expensetypes = Expensetype.all
	end

	def new
		@expensetype = Expensetype.new
	end

	def edit
		@expensetype = Expensetype.find(params[:id])
	end

	def create
		@expensetype = Expensetype.new(expensetype_params)
		if @expensetype.save
			redirect_to @expensetype
		else
			render 'new'
		end
	end

	def update
		@expensetype = Expensetype.find(params[:id])
		if(@expensetype.update(expensetype_params))
			redirect_to @expensetype
		else
			render 'edit'
		end
	end

	def destroy
    	@expensetype = Expensetype.find(params[:id])
    	@expensetype.destroy
    	redirect_to expensetypes_path
  	end

 	def show
    	@expensetype = Expensetype.find(params[:id])
    end
	private
  		def expensetype_params
    		params.require(:expensetype).permit(:title,  :description)
  		end
end
