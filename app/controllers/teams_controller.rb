class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def index
    @teams = Team.paginate page: params[:page]
  end

  def show
    @team = Team.find params[:id]
  end
  
  def create
    
    @team = Team.new team_params
    if @team.save
      flash[:success] = "Create a new team success!"
      redirect_to @team
    else
      render 'new'
    end
  end

  private 
    def team_params
      params.require(:team).permit(:name, :description, :id_leader)
    end

end
