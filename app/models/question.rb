class Question < ActiveRecord::Base
	belongs_to :session
	belongs_to :photo
end
