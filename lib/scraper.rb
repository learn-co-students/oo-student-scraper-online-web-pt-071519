require 'open-uri'
require 'pry'
require 'nokogiri'
 



class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("index_url"))
    all_students = doc.css(".roster-cards-container").text
binding.pry
    p all_students["name"]  
  
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

