class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :identify
  belongs_to :personaldoc
  belongs_to :education
  belongs_to :unifiedexam
  belongs_to :educationform
end
