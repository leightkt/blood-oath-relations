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

    def age_minimum
        16
    end

    def recruit_follower(follower)
        if follower.age > age_minimum
        Bloodoath.new(self, follower, todays_date)
        else
            p "Sorry, you are too young for this cult"
        end
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

    def followers
        Bloodoath.all.select do |bloodoath|
            bloodoath.cult == self
        end.map do |bloodoath|
            bloodoath.follower
        end
    end

    def average_age
        total_age = followers.reduce(0) do |sum, follower|
            sum + follower.age
        end
        average_age = (total_age.to_f / followers.count).round
    end

    def my_followers_mottos
        followers.map do |follower|
            follower.life_motto
        end.each do |motto|
            p motto
        end
    end

    def self.least_popular
        all.min_by do |cult|
            cult.followers.count
        end
    end

    def self.most_common_location
        location_array = all.map do |cult|
            cult.location
        end
        locations = {}
        location_array.each do |location|
            if locations[location] != nil
                locations[location] += 1
            else locations[location] = 1
            end
        end
        most_pop_location = locations.max_by do |location, count|
            count
        end[0]
    end

end