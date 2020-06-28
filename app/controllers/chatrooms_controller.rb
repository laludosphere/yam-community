class ChatroomsController < ApplicationController
  def index
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(flat: current_user.flats))
  end

  def show
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(flat: current_user.flats))
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    @chatroom.mark_messages_as_seen(current_user)
  end
end
