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
   
  # # create corp objects. This also calls on #initialize
  # def self.create_from_listings(all_listings)
  #   all_listings.each do |corp|
  #     corp = FindBCorps::Corp.new(corp)#calls the initialize method.
  #   end
  # end

  # def add_profile_attributes(profile_hash)
  #   @certified_date = profile_hash[:certified_date]
  #   @sectors = profile_hash[:sectors]
  #   @company_description = profile_hash[:company_description]
  #   @website_url = profile_hash[:website_url]
  # end

end


