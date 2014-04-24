class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def index
    @teams = Team.paginate page: params[:page]
  end

  def edit
    @team = Team.find params[:id]
  end

  def update
    @team = Team.find params[:id]
    if @team.update_attributes(team_params)
      flash[:success] = "Successful! Team updated."
      redirect_to @team
    else
      flash[:faild] = "Edit faild"
      render 'edit'
    end
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



  def destroy
    Team.find (params[:id]).destroy
    flash[:success] = "Team deleted."
    redirect_to teams_url
  end

  private 
    def team_params
      params.require(:team).permit(:name, :description, :id_leader)
    end

end
