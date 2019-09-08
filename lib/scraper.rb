require 'pry'
require 'open-uri'
require 'nokogiri'
# html = open("https://learn-co-curriculum.github.io/student--test-page/#"))

class Scraper
  def self.scrape_index_page(index_url)   # scrapes the student index page and returns an array of hashes
    scraped_students = []
    doc = Nokogiri::HTML(open(index_url))

    doc.css('.student-card a[href]').each do |students|
      scraped_students << {profile_url: students['href'], location: students.css('p').text, name: students.css('h4').text}
    end
    scraped_students
end

  def self.scrape_profile_page(profile_url)   # scrapes a student's profile page and returns a hash of attributes
    scraped_student = []
    doc = Nokogiri::HTML(open(profile_url))
    doc.css(".social-icon-container").children.css("a").each do |social| 
      scraped_student << {student_sites: social.attribute('href').value}
    
      student_url = {}
      scraped_student.each.with_index do |site, index|
        # binding.pry
        # if scraped_student.include?("linkedin")
        #   student_url["#{scraped_student}:"] = site
        # elsif scraped_student.include?("github")
        #   student_url["#{scraped_student}:"] = site
        # elsif scraped_student.include?("twitter")
        #   student_url["#{scraped_student}:"] = site
        # elsif scraped_student.include?("blog")
        #   student_url["#{scraped_student}:"] = site
        #  else
        #   student_url["#{scraped_student}:"] = scraped_student[index]
        # end 

        if scraped_student.include?("linkedin")
          student_url["#{scraped_student[index].scan(/\w+\b/)[2]}:"] = site
        elsif scraped_student.include?("github")
          student_url["#{scraped_student[index].scan(/\w+\b/)[1]}:"] = site
        elsif scraped_student.include?("twitter")
          student_url["#{scraped_student[index].scan(/\w+\b/)[1]}:"] = site
        elsif scraped_student.include?("blog")
          student_url["#{scraped_student[index].scan(/\w+\b/)[1]}:"] = site
        else
          student_url["#{scraped_student[index].scan(/\w+\b/)[1]}:"] = scraped_student[index].scan(/\w+\b/)
        end  
        scraped_student.to_hash 
        student_url
      end 

 
    end
  end

end