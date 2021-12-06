$data = ''

File.open('in', 'r') do |f|
    $data = f.read
end

a = $data.split.map(&:to_i)
a = a[2..].zip(a[1..], a).map(&:sum)

puts(a[1..].zip(a).count { |x, y| x > y })
