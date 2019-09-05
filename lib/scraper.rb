require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    binding.pry
    doc = Nokogiri::HTML(open("index_url"))
    all_students = doc.css(".roster-cards-container")
    
    all_students.collect do |student|
      p student.text.strip
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end