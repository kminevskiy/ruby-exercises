class School
  attr_accessor :classes

  def initialize
    @classes = Hash.new
  end

  def add(student, grade)
    classes[grade] = Array.new if !classes[grade]
    classes[grade].push(student)
    classes.values.each { |students| students.sort!}
  end

  def grade(g)
    classes[g] ? classes[g] : []
  end

  def to_h
    classes.sort.to_h
  end
end