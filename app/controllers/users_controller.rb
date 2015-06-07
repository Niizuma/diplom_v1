class UsersController < ApplicationController
  
  before_action :is_admin, only:[:generatedocs]

  def show
  	@user = User.find(params[:id]);
  end

  def generatedocs
  	@user = User.find(params[:id])
  	send_file @user.generatedocs
  end
  
  protected
  	def is_admin
  		unless current_user.admin?
  			flash[:error]="error!"
  			redirect_to root_path
		end
	end
end
