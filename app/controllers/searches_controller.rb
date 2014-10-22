class SearchesController < ApplicationController
    def create
      byebug
      @search = Search.new(search_params)
      if @search.valid?
        puts "valid search"
        byebug
        #redirect_to hotels_path
        #do I need to do something here to run to take the full_api_url and
        #then
      else
        puts 'invalid search?'
        byebug
        render :new
      end
    end
  
  private
  
    def search_params
      params.require(:search).permit(:name)
    end
end
