require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    collection = nil
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    doc.css("div.card-text-container").each do |student|
    student_name = student.css("h4.student-name").text
    student_location = student.css(".student-location").text
    #student_link = 
    collection = [{:name => student_name, :location => student_location}] #:profile_url = student_link
    binding.pry
    end
    collection
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

# :name => doc.css("div.card-text-container").first.css("h4.student-name").text
# :location => project.css("div.card-text-container").first.css(".student-location").text
# :profile_url => 
