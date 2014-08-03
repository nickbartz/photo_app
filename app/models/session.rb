class Session < ActiveRecord::Base
	has_many :questions
	has_many :photos, through: :questions	
end
