require 'open-uri'
require 'nokogiri'
require 'pry'


class Scraper

  def self.scrape_index_page(index_url)
    #def self.scrape_index_page(index_url)
    arr = []
    doc = Nokogiri::HTML(open(index_url))
    doc.css('.student-card').each do |card|
      hash = {
        profile_url: card.css('a').attr('href').value,
        #this allow me to pull the link to the profile out of the html on the page using the nokogiri.
        name: card.css('.student-name').text,
        location: card.css('.student-location').text 
      }
      arr << hash
    end
    arr
  end

  def self.scrape_profile_page(profile_url)

    doc = Nokogiri::HTML(open(profile_url))
    student_details = {}
    #doc.css(".social-icon-container a").map do |social_media|
      container = doc.css(".social-icon-container a").map {|icon| icon.attribute("href").value} 
      container.each do |social_media|
     # binding.pry
      if social_media.include?("twitter")
        #student_details = doc.css("div.social-icon-containter")[0]["href"] 
        student_details[:twitter] = social_media
      elsif social_media.include?("linkedin")
        student_details[:linkedin] = social_media
        #[:linkedin] = doc.css("div.social-icon-containter")[0]["href"]
      elsif social_media.include?("github")
        student_details[:github] = social_media
        #student_details[:github] = doc.css("div.social-icon-containter")[0]["href"]
      else social_media.include?("blog")
        student_details[:blog] = social_media
        #student_details[:blog]= doc.css("div.social-icon-container a")[0]["href"]
      #binding.pry
      end
    end 
    student_details[:profile_quote] = doc.css("div.vitals-text-container div.profile-quote").text
    student_details[:bio] = doc.css("div.details-container div.description-holder p").text
     
    student_details

  end 
    #binding.pry 

end

