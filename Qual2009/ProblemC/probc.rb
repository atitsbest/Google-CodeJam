S = "welcome to code jam"
A = []
S.each_char {|x| A << x}
puts A = A.uniq

# Cases 
$<.gets.to_i.times do |t|

  s = ""
  $<.gets.each_char {|c| s+=c if A.find{|x| c == x} }
  
    
  
  

  puts "Case ##{t+1}: #{j==S.length}"
end