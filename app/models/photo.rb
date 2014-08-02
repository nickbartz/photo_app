class Photo < ActiveRecord::Base
	has_and_belongs_to_many :sessions
	has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => "image/jpeg"
end
