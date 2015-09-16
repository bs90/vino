class NounsController < ApplicationController
  def index
    @nouns = if params[:query].present?
      Noun.where("LOWER(word) LIKE ?", "%#{params[:query].to_s.downcase}%")
    else
      Noun.where("image_url IS NOT NULL")
    end
  end

  def show
    @noun = Noun.find params[:id]
    @images = @noun.search_images
  end

  def update
    @noun = Noun.find params[:id]
    @noun.update_attributes(params.require(:noun).permit(:word,:meaning,:image_url))
    redirect_to nouns_path(query: params[:noun][:word])
  end
end
