require 'pry'

class Corp

  #meta programming for instance variables only.
  attr_accessor :name, :offerings, :location, :profile_url, :certified_date,:sectors,:company_description, :website_url

  @@all_listings = []

  def initialize(attributes)  #this needs to accept only 1 argument

    # can i use .send here and cut down on the code?
    #You can but you have to change how the arguments come in both for the initialize argument and how you actually send them in from the Scraper class.
    attributes.each do |key, value|
      self.send("#{key}=",value)
    end

    @@all_listings << self
  end

  def self.all_listings
    @@all_listings
  end
end
