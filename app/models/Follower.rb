class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all
        @@all
    end

    def cults
        bloodoaths = Bloodoath.all.select do |bloodoath|
            bloodoath.follower == self
        end

        bloodoaths.map do |bloodoath|
            bloodoath.cult
        end
    end

    def join_cult(cult)
        cult.recruit_follower(self)
    end

    def self.of_a_certain_age(age)
        all.select do |follower|
            follower.age >= age
        end
    end

    def my_cult_slogans
        cults.each do |cult|
            p cult.slogan
        end
    end
    
    def self.most_active
        all.max_by do |follower|
            follower.cults.count
        end
    end

    def self.top_ten
        sorted_followers = all.sort_by do |follower|
            follower.cults.count
        end.reverse
        sorted_followers.first(10)
    end

    def fellow_cult_members
        fellow_members = []
        self.cults.each do |cult|
            fellow_members << cult.followers
        end
        fellow_members = fellow_members.flatten.uniq
        fellow_members.delete(self)
        fellow_members
    end



end