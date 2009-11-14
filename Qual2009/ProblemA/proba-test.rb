words = []

# Counts
$<.gets =~ /(\d*) (\d*) (\d*)/
l = $1.to_i;

# Words of length l
$2.to_i.times {|d| words << $<.gets.chop}
  
$3.to_i.times do |n|  
	r = Regexp.new($<.gets.gsub(/\)/,']').gsub(/\(/,'['))

  result = words.select {|w| r.match(w) }.length

  puts "Case ##{n+1}: #{result}"
end 


