class PinsController < ApplicationController
	before_action :find_pin, only: [:show, :edit, :update, :destroy]
	def index
		@pins = Pin.all()
	end
	def show
		@pin = Pin.find(params[:id])
	end


	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		if @pin.save
			redirect_to @pin, notice: "Success!!"
		else
			render 'new'
		end

	end

	def update
	end

	private
	def pin_params
		params.require(:pin).permit(:description, :title)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end
end
