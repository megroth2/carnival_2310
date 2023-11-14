class Ride
  @@rides = []
  
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :rider_log,
              :total_revenue

  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @rider_log = Hash.new(0) # visitor => times_ridden
    @total_revenue = 0
  end

  def total_revenue
    total_times_ridden = @rider_log.values.sum { |times_ridden| times_ridden }
    @total_revenue = @admission_fee * total_times_ridden
  end

  def eligible?(visitor) # helper method for board_rider
    visitor.tall_enough?(@min_height) &&
    visitor.preferences.include?(@excitement) &&
    visitor.spending_money >= @admission_fee
  end

  def add_visitor_to_rider_log(visitor) # helper method for board_rider
    if @rider_log[visitor]
      @rider_log[visitor] += 1
    else
      @rider_log[visitor] = 1
    end
  end

  def reduce_visitor_spending_money(visitor) # helper method for board_rider
    visitor.spending_money -= @admission_fee
  end

  def board_rider(visitor)
    add_visitor_to_rider_log(visitor) && 
    reduce_visitor_spending_money(visitor) if
    eligible?(visitor)
  end

end