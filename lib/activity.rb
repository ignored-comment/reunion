class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    sum = 0
    @participants.map {|key, value| sum += value}
    sum
  end

  def split
    (total_cost / @participants.keys.length)
  end

  def owed
    result = {}
    @participants.each do |key, value|
      result[key] = (split - value)
    end
    result
  end
end
