require 'pry'
# I am testing branches, This is bcorp-2
class Scraper

  def self.scrape_listings
  # USA-only
    index_page = Nokogiri::HTML(open('https://bcorporation.net/directory?search=&industry=&country=United%20States&state=&city='))

    index_page.search("div.card__inner").each do |listing|
      name =  listing.css(".heading4.card__title").text
      offerings  =  listing.css(".field-name-field-products-and-services").text
      location = listing.css(".field-name-field-country").text.gsub!("Location: ", "").gsub!(", United States", "")
      profile_url = listing.css("a").attribute("href").value
      Corp.new(name, offerings, location, profile_url)
    end
  end

 # Scrape for items in full profile page for details that the listings scrape doesn't have.
  def self.scrape_profile_page(corp)
    profile_page = Nokogiri::HTML(open('https://bcorporation.net' + corp.profile_url))
    corp.certified_date = profile_page.css(".field-name-field-date-certified").text.gsub!("Certified Since: ", "")
    corp.company_description =  profile_page.css(".field-name-body").text
    corp.sectors = profile_page.css(".field-name-field-sector").text.gsub!("Sector: ", "")
    corp.website_url = profile_page.css(".field-name-field-website").text
  end
end
