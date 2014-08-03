class Photo < ActiveRecord::Base
	has_many :questions
	has_many :sessions, through: :questions
	has_attached_file :avatar, :styles => { :small => "600x600>"}
	validates_attachment_content_type :avatar, :content_type => "image/jpeg"
end
