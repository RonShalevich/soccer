class MessagesController < ApplicationController
  before_action :find_team
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def new
    @team = Team.find params[:team_id]
    @message = Message.new
  end

  def create
    @team = Team.find params[:team_id]
    @message = Message.new message_params
    @message.team = @team
    if @message.save
      @team.users.each do |user|
        MessagesMailer.notify_parent(user, @message).deliver_now
      end
      redirect_to team_players_path(@team), notice: 'Message Sent'
    else
      flash[:alert] = 'Please fix errors below'
      render '/teams'
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:text, :subject)
  end

  def find_team
    @team = Team.find params[:team_id] if params[:team_id]
  end
end
