require 'pry'
require 'open-uri'
require 'nokogiri'
# html = open("https://learn-co-curriculum.github.io/student--test-page/#"))

class Scraper
  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))

    # {name: doc_noko.css('h4').text#.strip.split(",  ") , location: doc_noko.css('p'),url: doc_noko.css('a div')
    # } 
    binding.pry

    doc.css('h4').each do |student_name| # .strip.gsub(/[\n]/,"")
      students = {name: student_name.text}
    end
    doc.css('p').each do |student_location|
      students = {location: student_location.text}
    end
    doc.css('a div').each |student_url|
      students = {student_url: student_url.text}
    end
    students
end

  def self.scrape_profile_page(profile_url)
    
  end

end