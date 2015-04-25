class Type < ActiveRecord::Base

	def to_label
		type_title
	end
end
