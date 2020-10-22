class Message < ApplicationRecord

	# linking chats and users to each message
  belongs_to :chat
  belongs_to :user
  
  validates_presence_of :body, :chat_id, :user_id
 
	# defines the time and date of each message 
 def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end
  

end
