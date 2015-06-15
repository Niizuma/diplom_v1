class PrioritiesController < ApplicationController
  def create
  	puts(params)

  	
  	@doc = Priority.new(doc_params());
    @doc.user = current_user
    if(@doc.save!)
      redirect_to root_path
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @doc.errors.full_messages} }
      end
    end
  end

  def new
  	@doc = Priority.new

  end


  protected
  def doc_params
    params.require(:priority).permit(:first, :second, :third, :specialization_id);
  end

end
