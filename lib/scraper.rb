require 'pry'
require 'open-uri'
require 'nokogiri'

# html = open("https://learn-co-curriculum.github.io/student--test-page/#"))

class Scraper

  attr_accessor :twitter, :blog, :facebook, :github, :linkedin
  # attr_reader :profile_url, :location, :name


  def self.scrape_index_page(index_url)   # scrapes the student index page and returns an array of hashes
    doc = Nokogiri::HTML(open(index_url))
    
    students_array = []
    doc.css('.student-card a[href]').each do |students|
      students_array << {profile_url: students['href'], location: students.css('p').text, name: students.css('h4').text}
    end
    students_array
end

  def self.scrape_profile_page(profile_url)   # scrapes a student's profile page and returns a hash of attributes
    profile_doc = Nokogiri::HTML(open(profile_url))
    url_hash = profile_doc.css("div.social-icon-container").children.css("a").map {|url| url.attribute('href').value}
   
    student_hash = {}

    url_hash.each do |site|
      # binding.pry 
      if url_hash.include?("twitter")
        student_hash[:twitter] = site
      elsif url_hash.include?("linkedin")
        student_hash[:linkedin] = site
      elsif url_hash.include?("github")
        student_hash[:github] = site
      elsif url_hash.include?("blog")
        student_hash[:blog] = site

      end
    end
  
   

    if profile_doc.css("div.profile-quote")  
      student_hash[:profile_quote] = profile_doc.css("div.profile-quote").text 
    end
    if profile_doc.css("div.bio-content.content-holder div.description-holder p")
      student_hash[:bio] = profile_doc.css("div.bio-content.content-holder div.description-holder p").text 
    end
   


      return student_hash
    
  end

end