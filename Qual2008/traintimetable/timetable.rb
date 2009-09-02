require 'time'

# {:minute => xxx, :station => :a}
@a = []
@d = []

# Stationen
@s = { :a => [], :b => [] }

# Tu es.
def calculate
	result = {:a => 0, :b => 0}

	(24*60).times do |minute|
		while (!@a.empty? and @a.first[:minute] == minute)
			puts "ARRIVAL at #{minute} in #{@a.first[:station]}. Trains waiting in station: #{@s[@a.first[:station]].length}"
			@s[@a.first[:station]].push(minute)
			@a.delete(@a.first)
		end

		while (!@d.empty? and @d.first[:minute] == minute)
			puts "DEPARTURE at #{minute} from #{@d.first[:station]}. Trains waiting in station: #{@s[@d.first[:station]].length}"
			s = @s[@d.first[:station]]
			if s.empty?
				s.push(minute)
				result[@d.first[:station]] += 1
			end
			s.pop
			@d.delete(@d.first)
		end
	end
	
	result
end

# Helper
def read_times(f, sd, sa, t)
	times = f.readline.split.map {|x| Time.parse(x)}
	@d << { :minute => (times[0].hour*60 + times[0].min), :station => sd }
	@a << { :minute => (times[1].hour*60 + times[1].min + t), :station => sa }
end

f = File.open('b-small-practice.in')

begin
	
	# Case count
	f.readline.to_i.times do |n|
	
		turnaround_time = f.readline.to_i
		
		# Anzahl der Fahrten lesen
		fares = f.readline.split.map {|x| x.to_i}

		@d.clear; @a.clear; @s[:a].clear; @s[:b].clear
		fares[0].times { read_times(f, :a, :b, turnaround_time) }
		fares[1].times { read_times(f, :b, :a, turnaround_time) }

		@d.sort! {|a,b| a[:minute] <=> b[:minute]}
		@a.sort! {|a,b| a[:minute] <=> b[:minute]}

		result = calculate
		
		puts "Case ##{n+1}: #{result[:a]} #{result[:b]}"
	
	end

ensure
	f.close if f
end

