class Add < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true



  validates :category, :title, :price, presence: true
  
  
  CATEGORY = %w{Whiskey Cigars}
  VINTAGE = %w{2020 2019 2018 2017 2016 2015 2014 2013 2012 2011 2010}
  
  end
  
  

 
  

