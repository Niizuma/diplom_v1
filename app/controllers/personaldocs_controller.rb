class PersonaldocsController < ApplicationController

def create
	puts(params)

  	@doc = Personaldoc.new(doc_params());
    if(@doc.save)
      redirect_to new_education_path;
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @doc.errors.full_messages} }
      end
    end
  end

  def new
  	@doc = Personaldoc.new
  end

protected
  def doc_params
    params.require(:personaldoc).permit(:first_name, :second_name, :third_name, :gender_id, :special_rights,:сп_возврата);
  end
end
