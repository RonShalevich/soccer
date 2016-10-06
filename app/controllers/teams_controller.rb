class TeamsController < ApplicationController
  before_action :authenticate_user!

  def new
    @team = Team.new
  end

  def index
    @teams = Team.order(created_at: :desc)
  end

  def show
    @team = Team.new
  end

  def create
    @team = Team.new team_params
    if @team.save
      @team.users << current_user
      redirect_to team_path(@team), notice: 'Team Created'
    else
      flash[:alert] = 'Please fix errors below'
      render '/teams'
    end
  end

  def destroy
    team = Team.find params[:id]
    team.destroy
    redirect_to teams_path
  end

  def team_params
    params.require(:team).permit(:name)
  end

  private

  def find_team
    @team = Team.find params[:id]
  end

  def find_params
    params.require(:team).permit(:name)
  end
end
