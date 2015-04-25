class EducationsController < ApplicationController

def create
  	puts(params)

  @doc = Education.new(doc_params());
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
  	@doc = Education.new
  end

  protected
  def doc_params
    params.require(:education).permit(:original, :etype_id, :series, :number, :where, :university);
  end

end
