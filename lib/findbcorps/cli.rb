
# The Command Line Interface Controller
require 'pry'

class CLI  
  # attr_accessor :all_attributes
  BASE_URL ='https://bcorporation.net'

  def start 
    make_corp_objects
    greeting
  end

 # -------SCRAPE & MAKE.-------#
  def make_corp_objects
    Scraper.scrape_listings
  end

  def greeting
    puts "\n\nThank you for using the FindBcorps app. Below you will find a list of all certified BCorps in the U.S.\n".upcase.bold.blue
    list_corporations
  end

  # -------LISTINGS----------#
  def list_corporations
    puts "Certified BCorporations in the United States:\n".bold

    Corp.all_listings.each.with_index(1) do |corp_name,index|
      puts "#{index}.#{corp_name.name}".upcase.bold
      puts "   #{corp_name.location}\n".blue
    end
    which_corp_to_show
  end

  #--------- PROFILES------------
  def which_corp_to_show
      puts  "If you would like to see more information about a listed corporation, enter their corresponding number now.\n".upcase.bold
      puts "OR, if you would like to exit the program, type \'quit\'/n".bold
    
    input = gets.strip
    bcorp_count = Corp.all_listings.count

    if input.to_i > 0 && input.to_i <= bcorp_count
      corp = Corp.all_listings[input.to_i - 1]#convert input to index.
     
      #additional details about corporation from the profile pages.
       Scraper.scrape_profile_page(corp)
        
          # print out the info about the specific corp chosen by user.
          puts "\nCorporation name:".upcase.bold.blue
          puts "#{corp.name}\n".bold
          puts "Location:".upcase.bold.blue
          puts "#{corp.location}\n\n"
          puts "Sector, Industry:".upcase.bold.blue
          puts  "#{corp.sectors}\n\n"
          puts "Products, Services:".upcase.bold.blue
          puts "#{corp.offerings}\n\n"
          puts "Certification Date:".upcase.bold.blue
          puts "#{corp.certified_date}\n\n"
          puts "Company Description:".upcase.bold.blue
          puts "#{corp.company_description}\n"
          puts "Website:".upcase.bold.blue
          puts "#{corp.website_url}\n\n"
          puts "----------------------------"
      menu

    elsif input == 'quit'.downcase
      puts "Thank you. You are now exiting the FindBCorps program.".upcase.bold.blue

    else
    #   #error message
     puts "The information you are entering is not working. Please be sure to type either 1 (see all listings) or 2 (exit program)\n\n".upcase.bold.red
    menu
    end
  end

#------------MENU--------------#
  def menu
    puts "What would you like to do next? Enter the corresponding number.".upcase.bold
    puts "1. View all Bcorp listings?"
    puts "2. Exit?"
    puts "----------------------------"
    
    input = gets.to_i
    if input == 1
      list_corporations
      
    elsif input == 2
      puts "\nYou have successfully exited the program. Thank you!".upcase.bold.blue
      exit
    else
      puts "Please enter 1 or enter 2. Any other input is not accurate.".bold.red
      menu
    end
  end
end

#TODO:
# #---------FOR VERSION 2--------------+
# def list_by_offerings
#     puts "We've listed products and services\n".upcase.bold
#     Corp.all_listings.each.with_index(1) do |corp_offerings, index|
#         puts "#{index}.#{corp_offerings.offerings}".upcase.bold.blue
#     end
#     binding.pry
# puts "Would you like to see that company?"
# end

# # def list_by_state
# #     # @sorted_listings.each.with_index(1) do |state,index|
# #     # puts "#{index}. #{state.location.upcase.bold} -- #{state.name}"
# # end
# # #-------END listings----------#



