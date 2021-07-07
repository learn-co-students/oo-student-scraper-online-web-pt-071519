require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html=Nokogiri::HTML (open(index_url))
    students=[]
    html.css("div.student-card").each do|student|
      hash={
        name: student.css(".student-name").text,
        location: student.css(".student-location").text,
        profile_url: student.css("a").attribute("href").value
      }
      students<<hash
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    html=Nokogiri::HTML(open(profile_url))
      individual_student={}
    html.css("div.social-icon-container a").each do |socials|
      url=socials.attribute("href").value
      if url.include? "twitter"
      individual_student[:twitter]=url
      elsif url.include? "linkedin"
      individual_student[:linkedin]=url
      elsif url.include? "github"
      individual_student[:github]=url
      else
      individual_student[:blog]=url
      end
      individual_student[:profile_quote]= html.css("div.profile-quote").text
      individual_student[:bio]=html.css("div.bio-content p").text
    end
    individual_student
  end

end
