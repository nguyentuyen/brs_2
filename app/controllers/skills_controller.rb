class SkillsController < ApplicationController

  def show
    @skill = Skill.find params[:id]
  end

  def index
    @skills = Skill.paginate page: params[:page]
  end

  
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new skill_params
    if @skill.save
      Activity.create( time: Time.now, action: "Create Skill", 
                                user: current_user.id, description: @skill.name)
      flash[:success] = "Create Successful!"
      redirect_to @skills
    else
      flash[:faild] = "fail"
      render 'new'
    end
  end

  def edit
    @skill = Skill.find params[:id]
  end

  def update
    @skill = Skill.find params[:id]
    if @skill.update_attributes skill_params
      Activity.create( time: Time.now, action: "Update Skill", 
                                user: current_user.id, description: @skill.name)
      flash[:success] = "Successful! Skill updated."
      redirect_to @skill
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
  end

  def destroy
   skill= Skill.find(params[:id])
    Activity.create( time: Time.now, action: "Deleted Skill", 
                                user: current_user.id, description: skill.name)
    skill.destroy
   flash[:success] = "Skill deleted."
    redirect_to skills_url
  end

  private

    def skill_params
      params.require(:skill).permit(:name)
    end
end
