class Educationform < ActiveRecord::Base
    enum state: [:full_time, :correspondence, :short_time]
	has_one :financingform
    accepts_nested_attributes_for :financingform

 	has_many :user


end
