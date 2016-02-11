def bsort(array)
  len, int = array.length, 0
  while int < len-1 do
     pair = bswitch(array.slice(int, 2))
     array[int], array[int+1] = pair.first, pair.last
     int += 1
  end
  array
end

def bswitch(pair)
  a, b = pair.first, pair.last
  a < b ? [ a, b ] : [ b, a ]
end

def is_correct?(array)
  len, int = array.length, 0
  while int < len-1 do
    if array[int] < array[int+1]
      int += 1
    else
      return false
    end
  end
  true
end

def bubble_sort(array)
  sorted = false
  while !sorted do
    array = bsort(array)
    sorted = is_correct?(array)
  end
  array
end



array = [*1..10]
array.shuffle!
puts bubble_sort(array)
