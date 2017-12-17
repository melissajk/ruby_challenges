# student name, grade
# all instance methods
# [[1, ["chloe", "dennis"]]].to_h = { 1 => ['chloe', 'dennis'] }

class School
  
  def initialize
    @roster = Hash.new { |roster, grade| roster[grade] = [] } 
  end
  
  def add(name, grade)
    @roster[grade].push(name).sort!
  end
  
  def grade(grade_num)
    @roster[grade_num]
  end
  
  def to_h
    @roster.sort.to_h
  end
end
