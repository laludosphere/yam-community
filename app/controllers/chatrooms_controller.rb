class ChatroomsController < ApplicationController
  before_action :skip_authorization

  def index
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(flat: current_user.flats))
    @last_chatroom = Message.last.chatroom
    redirect_to chatroom_path(@last_chatroom)
  end

  def show
    @chatrooms = policy_scope(Chatroom).where(user: current_user).or(Chatroom.where(flat: current_user.flats))
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    @chatroom.mark_messages_as_seen(current_user)
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @chatroom = Chatroom.new
    @chatroom.user = current_user
    @chatroom.flat = @flat
    @chatroom.name = @flat.user.first_name
    authorize @chatroom
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user, :name, :flat_id)
  end
end
