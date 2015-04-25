class Gender < ActiveRecord::Base

	def to_label
		gender_title
	end
end
