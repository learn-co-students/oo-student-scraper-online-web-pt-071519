require 'pry'
require 'open-uri'
require 'nokogiri'
# html = open("https://learn-co-curriculum.github.io/student-scraper-test-page/#"))



class Scraper
  def self.scrape_index_page(index_url)
    students = []
    doc = Nokogiri::HTML(open(index_url))

    doc.css(".roster-cards-container").each do |all_students| # .strip.gsub(/[\n]/,"")
      all_students.css(".student-card a").each do |student|
        student_url = ("#{student.attr('href')}").text
        student_name = student.css("student-name").text
        student_location = student.css("student-location").text
        # binding.pry
        students << {name: student_name, location: student_location, student_url: student_url}
      end
    end
    students
  
 

    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end