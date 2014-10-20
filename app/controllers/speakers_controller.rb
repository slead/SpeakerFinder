# This controller inherits from SecuredController. SecuredController uses
# Devise to make sure that the user is authenticated prior to invoking the
# specified actions
class SpeakersController < SecuredController
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'The object you tried to access does not exist'
    redirect_to :action => :index
  end

  def index
    @speakers = Speaker.paginate(page: params[:page])    
#    @speakers = Speaker.search(params[:search])
  end
  
  def new
    @speaker = Speaker.new
  end
  
  def create
    @speaker = Speaker.new(speaker_params)
    if @speaker.save
      flash[:success] = "Speaker #{@speaker.name} saved successfully."
      redirect_to speakers_path
    else
      errors = []
      @speaker.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
      render :new
    end
  end
  
  def edit
    @speaker = Speaker.find(params[:id])
  end
  
  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
  
    respond_to do |format|
      format.html { redirect_to(speakers_url) }
      format.xml  { head :ok }
    end
  end
  
  def show
    @speaker = Speaker.find(params[:id])
  end
  
  def update
    @speaker = Speaker.find(params[:id])
    if @speaker.update_attributes(speaker_params)
      flash[:success] = "Speaker #{@speaker.name} updated successfully."
      redirect_to speakers_path
    else
      render :edit
    end
  end
  
  private
    def speaker_params
      params.require(:speaker).permit(:name, :website, :email, :twitter_handle, :about, :city, :blurb, :image_url)
    end
  
end
