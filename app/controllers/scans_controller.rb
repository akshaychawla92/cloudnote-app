class ScansController < ApplicationController
before_action :authenticate_user!

	def index
		@scans = Scan.all
	end

	def new
		@scan = Scan.new
	end

	def create
		@scan = Scan.new(scan_params)
		@scan.save
		redirect_to @scan
	end

	def show
		@scan = Scan.find(params[:id])
	end

	def edit
		@scan = Scan.find(params[:id])
	end

	def update
		@scan = Scan.find(params[:id])
		@scan.update(scan_params)
		redirect_to @scan
	end

	def destroy
		@scan = Scan.find(params[:id])
		@scan.destroy
		redirect_to scans_path
	end

	private

		def scan_params
			params.require(:scan).permit(:title, :description, :image)
		end
end
