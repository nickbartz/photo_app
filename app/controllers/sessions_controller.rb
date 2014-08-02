class SessionsController < ApplicationController

	def index
		@sessions = Session.all 
	end

	def show
		@photo = Session.find(params[:id]).photos.first
	end

	def update
		@first = Session.find(params[:id]).photos.first
		
		@answer = params[:answer]
		if @answer == @first.name
			Session.find(params[:id]).photos.delete(@first)
		end
		redirect_to session_path
	end 

	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)
		@photos = Photo.all
		@session.photos << @photos
		@session.save
		redirect_to sessions_path
	end

	def delete
	end 

	private
		def session_params
			params.require(:session).permit(:session_name)
		end
end
