class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration)
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides << ride if !@rides.include?(ride)
  end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end

  def most_profitable_ride
    @rides.max_by {|ride| ride.total_revenue }
  end

  def most_popular_ride
    @rides.max_by {|ride| ride.rider_log.values.sum}
  end

end