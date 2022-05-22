class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @query = params[:query]
     redirect_to :root if @query == ''
    @results = PgSearch.multisearch(params[:query])
  end
end
