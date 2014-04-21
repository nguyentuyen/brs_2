class PositionsController < ApplicationController
  def index
    @position = Position.paginate page: params[:page]
  end

  def show
    @position = Position.find params[:id]
  end

  def new
    @position = Position.new
  end

  def destroy
    Position.find(params[:id]).destroy
    flash[:success] = "Position deleted."
    redirect_to Positions_url
  end

  def edit
    @position = Position.find params[:id]
  end

  def update
    @position = Position.new position_params
    if @position.update_attributes position_params
      flash[:success] = "Update done!"
      redirect_to @position
    else
      render 'position_edit'
    end
  end

  def create
    @position = Position.new position_params
    if @position.save
      flash[:success] = "Create done!"
      redirect_to @position
    else
      render 'position_new'
    end
  end  

  private
    def position_params
      params.require(:position).permit(:name, :short_name)    
    end
end