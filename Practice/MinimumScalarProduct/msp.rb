def scalar(v1, v2)
	result = 0
	v1.each_index {|x| result += v1[x] * v2[x]}
	result
end

$<.gets.to_i.times do |t|

	# Columns
	$<.gets
	
	v1 = $<.gets.split(' ').map {|x| x.to_i}
	v2 = $<.gets.split(' ').map {|x| x.to_i}

	# Versuch 1
	va1 = v1.sort {|a,b| a <=> b}
	va2 = (v2.sort {|a,b| a <=> b}).reverse!

	vb1 = va1.reverse!
	vb2 = va2.reverse!

	r = []
	r << scalar(va1, va2)
	r << scalar(vb1, vb2)

	puts "Case ##{t+1}: #{r.min}"
end