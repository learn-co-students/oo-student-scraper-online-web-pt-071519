require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
  
    doc = Nokogiri::HTML(open(index_url))
    
    scraped_students = [ ]

    doc.css("div.student-card").each do |info|
      students_info = {
              :name => info.css(".student-name").text,
              :location => info.css(".student-location").text,
              :profile_url => info.css("a").attribute("href").value
            } 
      scraped_students << students_info
    end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
    
    profiles = Nokogiri::HTML(open(profile_url))

    scraped_student = {}

      container = profiles.css(".social-icon-container a").collect {|icon| icon.attribute("href").value}
        container.each do |social|
          if social.include?("twitter")
            scraped_student[:twitter] = social
          elsif social.include?("linkedin")
            scraped_student[:linkedin] = social
          elsif social.include?("github")
            scraped_student[:github] = social
          elsif social.include?(".com")
            scraped_student[:blog] = social
          end
      end
        scraped_student[:profile_quote] = profiles.css("div.profile-quote").text
        scraped_student[:bio] = profiles.css(".description-holder p").text
      scraped_student
  end

end