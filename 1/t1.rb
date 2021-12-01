$data = ''

File.open('in', 'r') do |f|
    $data = f.read
end

a = $data.split.map(&:to_i)

sum = a[0...a.length - 1].zip(a[1..]).count { |x, y| (x <= y) }
puts sum