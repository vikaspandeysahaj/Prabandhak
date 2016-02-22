class CurrenciesController < ApplicationController
	def index
		@currencies = Currency.all
	end

	def new
		@currency = Currency.new
	end

	def edit
		@currency = Currency.find(params[:id])
	end

	def create
		@currency = Currency.new(currency_params)
		if @currency.save
			redirect_to @currency
		else
			render 'new'
		end
	end

	def update
		@currency = Currency.find(params[:id])
		if(@currency.update(currency_params))
			redirect_to @currency
		else
			render 'edit'
		end
	end

	def destroy
    	@currency = Currency.find(params[:id])
    	@currency.destroy
    	redirect_to currencies_path
  	end

 	def show
    	@currency = Currency.find(params[:id])
    end
	private
  		def currency_params
    		params.require(:currency).permit(:title,  :description)
  		end
end
