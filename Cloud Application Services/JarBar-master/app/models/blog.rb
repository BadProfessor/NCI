require 'httparty'
require 'uri'
require 'net/http'

class Blog
  include HTTParty


base_uri "https://jarbarreviews.herokuapp.com/"
 #base_uri "http://edutechional-resty.herokuapp.com/"
  
 def posts
  self.class.get('/articles')
    #self.class.get('/posts.json') 

  end
end
#blog = Blog.new


#blog_rest = Blog.new
#blog_rest.posts.each do |post|
#puts blog_rest.posts

#blog.posts['data'].each do |post|
 # p "Title: #{post['attributes']['slug']}"
  #puts blog.posts
#Post.create(title: post['title'], description: post['description'], url: post['url'])
#end


  




