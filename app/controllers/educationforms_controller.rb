class EducationformsController < ApplicationController

def create
  	puts(params)
  
  @doc = current_user.build_educationform(doc_params());

    if(@doc.save!)
      redirect_to new_educationform_path 
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @doc.errors.full_messages} }
      end
    end
  end

  def new
  	@doc = current_user.build_educationform
    @doc.build_financingform
  end

protected
  def doc_params
    params.require(:educationform).permit(:state, financingform_attributes:[:id, :budget, :paid, :paid_budg ]);
  end

end
