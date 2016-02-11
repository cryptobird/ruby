def bubble_sort(array)
  length, i = array.length, 0
  while i < array.length do
    bswitch(array.slice!(i, i+2)) + array
    i += 1
  end
end

def bswitch(pair)
  a, b = pair.first, pair.last
  a < b ? [ a, b ] : [ b, a ]
end
