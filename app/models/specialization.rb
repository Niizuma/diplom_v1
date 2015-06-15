class Specialization < ActiveRecord::Base
	belongs_to :chair
	has_many :user
end
