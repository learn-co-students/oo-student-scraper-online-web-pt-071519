

  class Student

    attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url
  
    @@all = []
  
    def initialize(student_hash)
       student_hash.each {|key, value|
        self.send(("#{key}="), value)}
        @@all << self
    end
  
    def self.create_from_collection(students_array)
      students_array.each {|student_hash| Student.new(student_hash)}
    end
  
    def add_student_attributes(attributes_hash)
      attributes_hash.each {|key,value| self.send(("#{key}="),value)}
    end
  
    def self.all
      @@all
    end
  end





#   def initialize(student_hash)
  
#     student_hash.each do |student_det_title, student_det| 
#       self.send("#{student_det_title}=", student_det)
#     end
#       @@all << self
#       return student_hash[:name]

    
#   end

#   def self.create_from_collection(students_array)
#     Scraper.scrape_index_page(students_array).each do |new_student| 
#       # @@all << new_student.new
#       Student.new = new_student
#       binding.pry
#     end
#     # Scraper.scraped_students[[:location]
#   end

#   def add_student_attributes(attributes_hash)

#     attributes_hash.each do |attr, value|
#       self.send("#{attr}=", value)
#     end
#   end

#   def self.all
#     @@all
#   end

