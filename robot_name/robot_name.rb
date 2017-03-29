class Robot
  attr_reader :name

  def initialize
    Kernel.srand
    @name = robot_name
  end

  def reset
    @name = robot_name
  end

  private

  def robot_name
    ('AA'..'ZZ').to_a.sample + ('000'..'999').to_a.sample
  end

end

Kernel.srand 1000
name1 = Robot.new
Kernel.srand 1000
name2 = Robot.new
p name1.name
p name2.name
