class ChatsController < ApplicationController
  before_action :authenticate_user!

# Defines the chat page for each user and displays who each user is chatting with
  def index
    @users = User.all
    @chats = Chat.all
  end

# defines the paramaters between a sender and recipient when creatting a new chat
  def create
    if Chat.between(params[:sender_id], params[:recipient_id]).present?
      @chat = Chat.between(params[:sender_id], params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
    redirect_to chat_messages_path(@chat)
  end

# a secuirty meassure that only allows a sender and recipient chat
  private
    def chat_params
      params.permit(:sender_id, :recipient_id)
    end

end