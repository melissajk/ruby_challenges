# input = hour, minutes (integers)
# clock that is independent of date
# add/subtract minutes (yield to a block)
# all class methods
# clock(215) == clock(215)
# output = "hh:mm" (string)
# sprintf("%02d:%02d", hours, minutes)  

class Clock
  MINUTES_IN_AN_HOUR = 60
  HOURS_IN_A_DAY = 24
  TOTAL_MINUTES_IN_A_DAY = MINUTES_IN_AN_HOUR * HOURS_IN_A_DAY
  
  def self.at(hours, minutes=0)
    new(hours, minutes)
  end
  
  def initialize(hours, minutes)
    @minutes = hours * MINUTES_IN_AN_HOUR + minutes
  end
  
  def time
    @minutes = @minutes % TOTAL_MINUTES_IN_A_DAY
    
    @minutes.divmod(MINUTES_IN_AN_HOUR)
  end
  
  def to_s
    sprintf("%02d:%02d", time.first, time.last )
  end
  
  def +(_minutes)
    @minutes += _minutes
    self
  end
  
  def -(_minutes)
    @minutes -= _minutes
    self
  end
  
  def ==(other)
    self.time == other.time
  end
end
