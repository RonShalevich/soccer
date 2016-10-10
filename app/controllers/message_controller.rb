class MessageController < ApplicationController
  before_action :find_team
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def new
    @team = Team.find params[:team_id]
    @message = Message.new
  end

  def create
    @team = Team.find params[:team_id]
    @message = Message.new message_params

    if @message.save
      @team.message << @message
      redirect_to team_path(@team), notice: 'Message Sent'
    else
      flash[:alert] = 'Please fix errors below'
      render '/teams'
    end
  end

  private

  def set_message
    @event = Event.find(params[:id])
  end

  def message_params
    params.require(:event).permit(:text, :subject)
  end

  def find_team
    @team = Team.find params[:team_id] if params[:team_id]
  end
end
