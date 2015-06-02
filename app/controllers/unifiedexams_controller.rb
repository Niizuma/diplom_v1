class UnifiedexamsController < ApplicationController

def create
  	puts(params)

  @document = Unifiedexam.new(document_params());
  @doc.user = current_user
    if(@document.save!)
      redirect_to new_educationform_path
    else
      respond_to do |format|
        format.html {render 'new'}
        format.json { render :json => {errors: @document.errors.full_messages} }
      end
    end
  end

  def new
  	@document = Unifiedexam.new
  end

protected
  def document_params
    params.require(:unifiedexam).permit(:original, :year, :number, :russian, :math, :social_science, :physics);
end

end
