class EducationformsController < ApplicationController

def create
  	puts(params)
  
  @doc = Educationform.new(doc_params());
    if(@doc.save)
      redirect_to(:back)
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @doc.errors.full_messages} }
      end
    end
  end

  def new
  	@doc = Educationform.new
    @doc.build_financingform
  end

protected
  def doc_params
    params.require(:educationform).permit(:state, financingform_attributes:[:id, :budget, :paid, :paid_budg ]);
  end

end
