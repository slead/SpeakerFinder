class SkillsController < SecuredController

  def index
    @skills = Skill.all
  end
    
  def new
    @skill = Skill.new
    
  end
  
  def create
    key = skill_params[:key]
    puts key
    @skill = Skill.find_or_create_by(skill_params)
    if @skill.save
      flash[:success] = "Skill #{@skill.title} saved successfully."
      redirect_to skills_path
    else
      errors = []
      @skill.errors.full_messages.each do |msg|
        errors << msg
      end
      flash.now[:error] = errors
      render :new
    end
  end
  
  def edit
  
  end
  
  def destroy
  
  end
  
  def show
  
  end
  
  def update
  
  end
  
  private
    def skill_params
      params.require(:skill).permit(:title, :key)
    end
    
end
