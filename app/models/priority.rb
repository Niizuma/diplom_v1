class Priority < ActiveRecord::Base
	belongs_to :specialization
	has_one :user
	def to_label
		Specialization.title
	end
end
