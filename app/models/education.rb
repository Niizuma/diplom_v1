class Education < ActiveRecord::Base
	belongs_to :etype
	has_one :user
end
