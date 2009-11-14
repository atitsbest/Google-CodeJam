def flow(i)
	n = neighbours(i)	
	q = n.map {|x| {:a => @as[x], :i => x}}
	q.sort! do |a,b| 
		if a[:a] == b[:a]
			a[:i] <=> b[:i]
		else
			a[:a] <=> b[:a]
		end
	end
	q.first[:i]
end

def sink?(i)
	n = neighbours(i)
	n.find {|x| @as[x] < @as[i]} == nil
end

def neighbours(i)
	p = []
	p << i-@w if i-@w >= 0
	p << i-1 if i%@w > 0
	p << i+1 if i%@w != @w-1
	p << i+@w if i+@w < @as.length
	p
end

def label(i)
	if sink?(i)
#		puts "SINK"
		if @ls[i] == nil 
			@ls[i] = "s#{@sc}" 
			@sc+=1
		end
		@ls[i] =~ /s(\d+)/
		return $1.to_i
	else
		ni = flow(i)
		return label(ni)
	end
end


# Cases
$<.gets.to_i.times do |t|
	# init
	@sc = 0

	# Height & Width
	$<.gets =~ /(\d*) (\d*)/
	@h = $1.to_i
	@w = $2.to_i
	@as = [] # Altitudes
	
	# Altidutes
	@h.times do
		$<.gets.split(/ /).each {|x| @as << x.to_i}
	end
	@ls = Array.new(@as.length, nil) # Labels
	
	# Flow
	@as.each_index do |i| 
		@ls[i] = label(i) if @ls[i] == nil
	end
	
	# Label flow path
	@ls.each_index do |i|
		if @ls[i] =~ /s(\d+)/
			@ls[i] = ($1.to_i+97).chr
		else
			@ls[i] = (@ls[i].to_i+97).chr
		end
	end
	
	# Print result
	puts "Case ##{t+1}:"
	for i in (0...@h) 
		puts @ls[(i*@w),@w].join(' ')
	end
end

