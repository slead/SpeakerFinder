# This controller inherits from SecuredController. SecuredController uses
# Devise to make sure that the user is authenticated prior to invoking the
# specified actions
class SpeakersController < SecuredController
  rescue_from ActiveRecord::RecordNotFound do
    flash[:notice] = 'Sorry, that speaker does not exist'
    redirect_to action: :index
  end

  def index
#    if params[:search]
#      @speakers = Speaker.search(params[:search]).order("name ASC")
#    elsif params[:geosearch]
#      @speakers = Speaker.near(params[:geosearch], 500).order("name ASC")
#    else
#      @speakers = Speaker.all.order("name ASC")
#    end
    if params[:search].present?
      @speakers = Speaker.search(params[:search], page: params[:page])
    elsif params[:geosearch]
      @speakers = Speaker.near(params[:geosearch], 500).order("name ASC")
    else
      @speakers = Speaker.all.page params[:page]
    end
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
  
  def autocomplete
    render json: Speaker.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end
  
  private
  
  def speaker_params
    params.require(:speaker).permit(:name, :website, :email, :twitter_handle, :about, :city, :blurb, :image_url)
  end  
end
