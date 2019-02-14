require 'pry'

class Corp

  #meta programming for instance variables only.
  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@all_listings = []

  def initialize(name, offerings, location, profile_url)
    @name = name
    @offerings = offerings
    @location = location
    @profile_url = profile_url
    # can i use .send here and cut down on the code?
    # attributes.each do |key, value|
    # self.send("#{key}=",value)
  end

    @@all_listings << self
  end

  def self.all_listings
    @@all_listings
  end
end
