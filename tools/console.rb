require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#cult seeds
cromulons = Cult.new('Cromulons', 'Cygnus-5', 2015, 'Get Schwifty')
jonestown = Cult.new('Jonestown', 'Indianapolis', 1950, 'We drink the koolaid')
heavensgate = Cult.new("Heaven/'s Gate", 'San Diego', 1974, 'We love space and aliens')
solartemple = Cult.new('Order of the Solar Temple', 'Geneva', 1984, 'Doomsday is real')
#follower seeds
hillary = Follower.new('Hillary Clinton', 73, 'Roll that shit, smoke that shit')
paul = Follower.new('Paul Stamets', 65, 'Fungi are friends')
dave = Follower.new('Dave Tipper', 44, '????')
danny = Follower.new('Danny DeVito', 76, "I'm big, you're little")
summer = Follower.new('Summer Smith', 20, 'What the fuck, grandpa?')
kim = Follower.new('Kim Possible', 17, 'Call me, beep me, if you wanna reach me')
# bloodoath seeds
oath1 = Bloodoath.new(cromulons, summer, '2015/2/11')
oath2 = Bloodoath.new(jonestown, kim, '1951/1/1')
oath3 = Bloodoath.new(jonestown, paul, '1951/1/1')
oath4 = Bloodoath.new(jonestown, danny, '1952/1/1')
oath5 = Bloodoath.new(jonestown, hillary, '1952/1/1')
oath6 = Bloodoath.new(heavensgate, dave, '1974/1/1')
oath7 = Bloodoath.new(heavensgate, paul, '1988/11/1')
oath8 = Bloodoath.new(solartemple, kim, '1989/12/1')
oath8 = Bloodoath.new(solartemple, hillary, '1990/4/1')
oath8 = Bloodoath.new(solartemple, danny, '1994/3/2')

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
