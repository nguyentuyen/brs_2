class ProjectsController < ApplicationController

	 def show
    @project = Project.find params[:id]
  end

  def new
    @project = Project.new
  end

  def destroy
    project= Project.find(params[:id]).destroy
    Activity.create( time: Time.now, action: " Delete Project", 
                       user: current_user.id, description: project.name)
    flash[:success] = "project deleted."
    redirect_to projects_path
  end

  def index
    @projects = Project.paginate page: params[:page]
  end

  def edit
    @project = Project.find params[:id]
  end

  def update
    @project = Project.find params[:id]
    if @project.update_attributes project_params
      Activity.create( time: Time.now, action: " Delete Project", 
                       user: current_user.id, description: @project.name)
      flash[:success] = "Update done!"
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def create
    @project = Project.new project_params
    if @project.save
      Activity.create( time: Time.now, action: " Create Project", 
                       user: current_user.id, description: @project.name)
      redirect_to projects_path
    else
      render 'new'
    end
  end  

  private
    def project_params
      params.require(:project).permit(:name, :short_name, :start_date, :end_date, :id_leader)    
    end
end    
