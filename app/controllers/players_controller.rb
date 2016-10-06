class PlayersController < ApplicationController
  before_action :find_team

  def new
    @player = Player.new
  end

  def create
    @player = Player.new player_params
    @team = Team.find params[:team_id]
    if @player.save
      @team.players << @player
      redirect_to team_path(current_team), notice: 'Player Created'
    else
      flash[:alert] = 'Please fix errors below'
    end
  end

  def index
    @team = Team.find params[:team_id]
    @players = @team.players.order(jersey_number: :desc)
  end

  def edit

  end

  def destroy
    player = Player.find params[:id]
    @team = Team.find params[:team_id]
    player.destroy
    redirect_to team_path(@team)
  end

  def player_params
    params.require(:player).permit(:first_name,
                                   :last_name,
                                   :jersey_number,
                                   :position,
                                   :parent)
  end

  def show
    @player = Player.find params[:id]
  end

  private

  def find_player
    @player = Player.find params[:id]
  end

  def find_team
    @team = current_team
  end

  def find_params
    params.require(:player).permit(:first_name,
                                   :last_name,
                                   :jersey_number)
  end
end
