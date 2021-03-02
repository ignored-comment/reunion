class Reunion

  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total_cost = @activities.flat_map do |activity|
      activity.participants.values
    end
    total_cost.sum
  end

  def breakout
    result = {}
    @activities.each do |activity|
      activity.owed.each do |key, value|
        result[key] = [] if result[key].nil?
        result[key] << value
      end
    end
    sum_result = result.transform_values {|value| value.sum}
  end

  def summary
    sentence = breakout.map do |name, owed|
      "#{name}: #{owed}"
    end.join("\n")
  end
end
