class IdentifiesController < ApplicationController
  def create
  	puts(params)

  	@doc = Identify.new(doc_params());
    @doc.user = current_user
    if(@doc.save!)
      redirect_to new_personaldoc_path
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
    params.require(:identify).permit(:original, :type_id, :unit, :issued_by, :birthday,:series,:number, :where, :country);
  end
end
