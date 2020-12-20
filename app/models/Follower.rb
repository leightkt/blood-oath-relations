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

end