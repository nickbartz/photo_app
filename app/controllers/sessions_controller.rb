class SessionsController < ApplicationController

	def index
		@sessions = Session.all
	end

	def show
		@questions = Session.find(params[:id]).questions
		@score = @questions.length
		if @score >= 1
			@photo_id = Photo.find(@questions.first.photo_id)
		end 
	end

	def update
		@session = Session.find(params[:id])
		@question = @session.questions.first
		if @session.questions.length >= 1 
			if params[:answer] == Photo.find(@question.photo_id).name
				@question.delete
				flash[:success] = "Correct!"
			elsif params[:answer].empty?
				@session.photos << Photo.find(@question.photo_id)
				@question.delete
				flash[:info] = "Better luck next time"
			else
				@session.photos << Photo.find(@question.photo_id)
				@question.delete
				flash[:error] = "Wrong!"
			end
		end 
		redirect_to session_path
	end

	def new
		@session = Session.new
	end

	def create
		@session = Session.new(session_params)
		@photos = Photo.all
		@session.photos << @photos[0..5]
		@session.save
		redirect_to sessions_path
	end

	def destroy
    	Session.find(params[:id]).destroy
    	redirect_to sessions_url
  	end 

	private
		def session_params
			params.require(:session).permit(:session_name)
		end
end
