class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end
 
  def new
    @photo = Photo.new
  end 

  def create
  	@photo = Photo.new(photo_params)
  	@photo.save
  	redirect_to new_photo_path
  end 

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:success]= "User deleted."
    redirect_to photos_url
  end 

	private
		def photo_params
			params.require(:photo).permit(:name, :filename, :avatar)
		end


end
