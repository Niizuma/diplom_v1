class Personaldoc < ActiveRecord::Base
	belongs_to :gender
	has_one :user
end
