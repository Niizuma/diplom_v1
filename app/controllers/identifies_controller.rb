class IdentifiesController < ApplicationController
  def create
  	puts(params)

  	@doc = Identify.new(doc_params());
    if(@doc.save)
      redirect_to(:back);
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @doc.errors.full_messages} }
      end
    end
  end

  def new
  	@doc = Identify.new
  end

  protected
  def doc_params
    params.require(:identify).permit(:series,:number, :where, :country);
  end
end
