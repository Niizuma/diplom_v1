class Educationform < ActiveRecord::Base
    enum state: [:дневное, :заочное, :очно_заочное]
	has_one :financingform
    accepts_nested_attributes_for :financingform

    has_many :user


end
