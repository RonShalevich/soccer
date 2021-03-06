class PlayersController < ApplicationController
  before_action :find_team
  before_action :find_player, only: [:edit]

  def new
    @player = Player.new
    @player.avatar = params[:file]
  end

  def create
    @player = Player.new player_params
    @team = Team.find params[:team_id]
    if @player.save
      @team.players << @player
      redirect_to team_players_path(@team), notice: 'Player Created'
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

  def update
    @player = Player.find params[:id]
    @player.avatar = params[:file]
    if @player.update params.require(:player).permit(:first_name,
                                                     :last_name,
                                                     :jersey_number,
                                                     :position,
                                                     :parent,
                                                     :avatar)
      redirect_to team_player_path(@team, @player)
    else
      render :edit
    end
  end

  def destroy
    player = Player.find params[:id]
    @team = Team.find params[:team_id]
    player.destroy
    redirect_to team_players_path(@team)
  end

  def player_params
    params.require(:player).permit(:first_name,
                                   :last_name,
                                   :jersey_number,
                                   :position,
                                   :parent,
                                   :avatar)
  end

  def show
    @player = Player.find params[:id]
  end

  private

  def find_player
    @player = Player.find params[:id]
  end

  def find_team
    @team = Team.find params[:team_id] if params[:team_id]
  end

  def find_params
    params.require(:player).permit(:first_name,
                                   :last_name,
                                   :jersey_number)
  end
end
