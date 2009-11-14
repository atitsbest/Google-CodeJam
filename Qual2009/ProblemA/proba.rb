words = []

# Counts
$<.gets =~ /(\d*) (\d*) (\d*)/
l = $1.to_i;

# Words of length l
$2.to_i.times {|d| words << $<.gets.chop}
  
$3.to_i.times do |n|  
	w = Array.new(words)
	pattern = $<.gets
#	puts pattern
	j=0 # index in word
	i=0 # index im pattern
	
	while(!w.empty? && j < l)
		c = pattern[i]; i+=1
		if c == 40 #(
			ps = []
			while pattern[i] != 41 #)
				ps << pattern[i]
				i+= 1
			end
			i+=1
			
#			puts "Multi: #{ps}"
			w = w.select {|x| ps.find{|p| x[j] == p}}
		else
			w = w.select {|x| x[j] == c}
		end

		j+=1
	end
		
  puts "Case ##{n+1}: #{w.length}"
end 


