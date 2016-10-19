class CardsController < ApplicationController
before_action :authenticate_user!


	def index
		@cards = Card.all
	end

	def new
		@card = Card.new
	end

	def create
		@card = Card.new(card_params)
		@card.save
		redirect_to @card
	end

	def show
		@card = Card.find(params[:id])
	end

	def edit
		@card = Card.find(params[:id])
	end

	def update
		@card = Card.find(params[:id])
		@card.update(card_params)
		redirect_to @card
	end

	def destroy
		@card = Card.find(params[:id])
		@card.destroy
		redirect_to cards_path
	end

	private

		def card_params
			params.require(:card).permit(:name, :card_number, :expiry_date, :security_code, :bank_name)
		end

end
