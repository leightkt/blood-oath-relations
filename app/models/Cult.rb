class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all
        @@all 
    end

    def todays_date
        Time.now.to_s.split(" ")[0]
    end

    def recruit_follower(follower)
        Bloodoath.new(self, follower, todays_date)
    end

    def cult_population
        Bloodoath.all.select do |bloodoath|
            bloodoath.cult == self
        end.count
    end

    def self.find_by_name(name)
        all.find do |cult|
            cult.name == name
        end
    end

    def self.find_by_location(location)
        all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(year)
        all.select do |cult|
            cult.founding_year == year
        end
    end

end