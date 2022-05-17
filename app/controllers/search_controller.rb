class SearchController < ApplicationController
  def index
    puts 'query :'
    puts :query
    @results = PgSearch.multisearch(params[:query])
  end
end
