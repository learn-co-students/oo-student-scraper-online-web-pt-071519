doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/index.html"))

# html = open(https://learn-co-curriculum.github.io/student-scraper-test-page/index.html)
# doc.css(".roster-cards-container").text
doc.css(".roster-cards-container").text
binding.pry
print doc.css(".roster-cards-container").text

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    
  end

  def self.create_from_collection(students_array)
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
  #           </div>      
  end

  def add_student_attributes(attributes_hash)
    
  end

  def self.all
    @@all
  end
end

