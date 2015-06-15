class SpecializationsController < ApplicationController
  def create
  	puts(params)

  	@doc = Specialization.new(doc_params());
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
  	@doc = Specialization.new
  end

  protected
  def doc_params
    params.require(:specialization).permit(:title, :chair_id);
  end
end
