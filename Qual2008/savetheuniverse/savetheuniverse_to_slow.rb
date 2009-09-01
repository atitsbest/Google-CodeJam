# Wechsel berechnen
def calculate(s, q, s_current=nil)
	result = []
	count = -1
	s_current = get_next_s(s) unless s_current
	
	q.each_with_index do |query,i|
		if (query == s_current)
			s_current = get_next_s(s)
			if (i > 0)
				result << calculate(s, q.slice(i..-1), s_current)
				count += 1
			end
		end
	end
	
	return count + (result.min || 0)
end

def get_next_s(s)
	s.push(s.shift).first
end


f = File.open('a-small-practice.in')
count = 0

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
		if (q.uniq - s).length != q.uniq.length - s.length
			result = 0
		else
			result = calculate(s, q)
		end
		
		# Ausgabe:
		puts "Case ##{case_number+1}: #{result}"
	end

ensure
	f.close
end