class ManagingsController < ApplicationController
  def create
    managing = Managing.new
    team = Team.find params[:team_id]
    managing.team = team
    managing.user = current_user
    if managing.save
      redirect_to team_path(team), notice: 'Team Added'
    else
      redirect_to team_path(team), alert: "Couldn't add Team"
    end
  end

  def destroy
    team = Team.find.params[:team_id]
    managing = current_user.managings.find params[:id]
    managing.destroy
    redirect_to team_path(team), notice: 'Team Removed!'
  end
end
