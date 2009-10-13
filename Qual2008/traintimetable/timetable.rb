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
			t = @a.shift
			@s[t[:station]].push(minute)
		end

		while (!@d.empty? and @d.first[:minute] == minute)
			t = @d.shift
			s = @s[t[:station]]
			if s.empty?
				result[t[:station]] += 1
			else
				s.pop
			end
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

f = File.open('b-large-practice.in')

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

