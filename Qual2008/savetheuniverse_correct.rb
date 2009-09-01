# Wechsel berechnen
def calculate(s, q)
	segment = []
	result = 0

	q.each_with_index do |query,i|
		if (!segment.find {|x| query == x})
			if (segment.length == s.length-1)
				result += 1
				segment.clear
			end
			segment << query
		end
	end
	
	result
end

f = File.open('a-small-practice.in')

begin

	# Case count
	f.readline.to_i.times do |case_number|
		s = []
		# Engine count
		f.readline.to_i.times do
			s << f.readline.chomp
		end

		q = []
		# Query count
		f.readline.to_i.times do 
			q << f.readline.chomp
		end
		
		# Gibt es einen Weg ohne Umschalten?
		result = calculate(s, q)
		
		# Ausgabe:
		puts "Case ##{case_number+1}: #{result}"
	end

ensure
	f.close
end