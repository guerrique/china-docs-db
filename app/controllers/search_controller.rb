class SearchController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    puts 'query :'
    puts :query
    @results = PgSearch.multisearch(params[:query])
  end
end
