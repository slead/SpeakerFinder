class SearchesController < ApplicationController
  def create
    @search = Search.new(search_params)
    if @search.valid?
      puts "valid search"
    else
      puts 'invalid search?'
      render :new
    end
  end
  
  private
  
  def search_params
    params.require(:search).permit(:name)
  end
end
