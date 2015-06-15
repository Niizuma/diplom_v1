class Specialization < ActiveRecord::Base
	belongs_to :chair
	has_one :priority
end
