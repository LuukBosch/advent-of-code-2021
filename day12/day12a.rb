
map = {}
File.readlines('input.txt', chomp: true).each do |line|
  origin, destination = line.split("-")
  map[origin] ||= []
  map[destination] ||= []
  map[origin] << destination
  map[destination] << origin
end


route_set = [["start"]]

while true
  new_route_set = []
  route_set.each do |route|
    if route.last == "end"
      new_route_set << route
      next
    end
    map[route.last].each do |option|
      next if option ==  "start"
      next if /[[:lower:]]/.match(option) && route.include?(option)
      new_route_set << (route.clone << option)
    end
  end
  if new_route_set.size == route_set.size
    pp new_route_set.size
    break
  end
  route_set = new_route_set
end

