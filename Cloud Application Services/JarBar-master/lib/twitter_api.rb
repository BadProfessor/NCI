class TwitterAPI
  def self.public_tweets
    client.user_timeline('cigarwhiskey', count: 10, exclude_replies: true, include_rts:true)
  end

  def self.client    
   @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = "V2GDbjIWvs4Ggs9fDMNj8UDUN"
        config.consumer_secret     = "3ofcGKsVDX36ANTDi0NqNNTfvz8CrlXScJ59P974gIIM5MDDPz"
        end
    end
end
