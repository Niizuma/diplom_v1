class EducationsController < ApplicationController

def create
  	puts(params)

  @doc = Education.new(doc_params());
  @doc.user = current_user
    if(@doc.save!)
      redirect_to new_unifiedexam_path
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
