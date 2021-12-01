$data = ''

File.open('in', 'r') do |f|
    $data = f.read
end

a = $data.split.map(&:to_i)
a = a[2..].zip(a[1..], a).map(&:sum)

puts(a[0...a.length - 1].zip(a[1..]).count { |x, y| (x <= y) })
