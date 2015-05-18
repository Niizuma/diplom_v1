class Identify < ActiveRecord::Base
	belongs_to :type
	has_one :user
end
