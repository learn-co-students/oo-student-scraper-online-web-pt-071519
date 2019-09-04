require 'open-uri'
require 'pry'
require 'nokogiri'
 

html = open(https://learn-co-curriculum.github.io/student-scraper-test-page)


class Scraper
# take the string of HTML returned
# by open-uri's `open` method and converts it into a NodeSet 

doc = Nokogiri::HTML(html)

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("index_url"))
    all_students = doc.css(".roster-cards-container").text
binding.pry
    p all_students["name"]  
  
  #   index = #block-views-events-block-upcoming-summary > div > div > div.view-header > div > h2

  #   https://learn-co-curriculum.github.io/student-scraper-test-page/#
  
  #   body > div.main-wrapper.roster > div
  
  # <div class="student-card" id="ryan-johnson-card">
  #             <a href="students/ryan-johnson.html">
  #               <div class="view-profile-div">
  #                 <h3 class="view-profile-text">View Profile</h3>
  #               </div>
  #               <div class="card-text-container">
  #                 <h4 class="student-name">Ryan Johnson</h4>
  #                 <p class="student-location">New York, NY</p>
  #               </div>
  #             </a>
  #           </div>  end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

