class MessagesController < ApplicationController
  before_action :find_chat
  
# displays the messages between a sender and recipient and restricts messages to a maxium of five
  def index
    @messages = @chat.messages

    if @messages.length > 5
      @over_five = true
      @messages = @messages[-5..-1]
    end

    if params[:m]
      @over_five = false
      @messages = @chat.messages
    end
    
    @message = @chat.messages.new
  end
  
# defines the paramaters when messaging an Author of an Ad
  def create
    @message = @chat.messages.new(message_param)
    if @message.save
      redirect_to chat_messages_path(@chat)
    end
  end
 
# displays the messsage as a chat once created
  def new
    @message = @chat.messages.new
  end
  
  
  private
  
# permissions to post the body of the mesage and user id
  def message_param
    params.require(:message).permit(:body, :user_id)
  end
  
  def find_chat
    @chat = Chat.find(params[:chat_id])
  end
end