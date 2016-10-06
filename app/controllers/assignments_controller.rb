class AssignmentsController < ApplicationController
  def create
    assignment = Assignment.new
    player = Player.find params[:player_id]
    assignment.player = player
    assignment.team = current_team
    if assignment.save
      redirect_to team_players_path(current_team), notice: 'Player Added'
    else
      redirect_to team_players_path(current_team), alert: "Couldn't add Player"
    end
  end

  def destroy
    player = Player.find.params[:player_id]
    assignment = current_team.assignments.find params[:id]
    assignment.destroy
    redirect_to team_players_path(team), notice: 'Team Removed!'
  end
end
