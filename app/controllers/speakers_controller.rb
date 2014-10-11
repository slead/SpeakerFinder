class SpeakersController < ApplicationController

  def index
    @speakers = Speaker.all
  end
  
  def new
  
  end
  
  def create
    @speaker = Speaker.new(speaker_params)
    @speaker.save
    redirect_to @speaker
  end
  
  def destroy
  
  end
  
  def show
    @speaker = Speaker.find(params[:id])
  end
  
  private
    def speaker_params
      params.require(:speaker).permit(:name, :website, :email, :twitter_handle, :about)
    end
  
end
