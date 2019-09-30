class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url 

  @@all = []

  def initialize(student_hash)
    student_hash.each {|atr,value| self.send(("#{atr}="), value)}
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each  {|student| self.new(student)}
  
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |atr, value|
      self.send(("#{atr}="), value)
    end
  end

  def self.all
    @@all
  end
end

