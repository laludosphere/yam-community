class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(flat: current_user.flats))
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end
end
