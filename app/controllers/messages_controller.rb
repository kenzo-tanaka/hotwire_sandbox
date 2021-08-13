class MessagesController < ApplicationController
  before_action :set_room, only: %i[new create edit update]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create!(message_params)

    respond_to do |format|
      format.html { redirect_to @room }
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)

    respond_to do |format|
      format.html { redirect_to @room }
    end
  end

  private

    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:content)
    end
end
