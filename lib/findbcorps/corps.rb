require 'pry'

class FindBCorps::Corp

  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url
 
  @@all_listings = []

  def initialize(name, offerings, location, profile_url)
    @name = name
    @offerings = offerings
    @location = location
    @profile_url = profile_url
   
    @@all_listings << self
  end
    
  def self.all_listings
    @@all_listings
  end
end


