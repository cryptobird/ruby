# require 'byebug'

def comb(array)
  gap = array.length-1 #set initial gap length
  while gap >= 0 do
    array = pass(array, gap)
    gap -= 1
  end
  array
end

def comb_switch(inner_array)
  infix = inner_array.slice!(1, inner_array.length-2)
  inner_array.insert(1, infix)
  inner_array.reverse!
end

def pass(array, gap) #loop over array, switching items on either side of gap
  inc = 0
  while inc + gap < array.length do
    if gap == 0
      pair = array.slice!(inc, 2)
      pair.first < pair.last ? array.insert(inc, pair) : array.insert(inc, pair.reverse)
    else
      inner_array = array.slice!(inc, gap)
      needs_switch?(inner_array) ? comb_switch(inner_array) : inner_array
      array.insert(inc, inner_array)
    end

    array.flatten!
    inc += 1
  end

  array
end

def needs_switch?(array)
  array.first > array.last
end

def is_correct?(array)
  len, int = array.length, 0

  while int < len-1 do
    array[int] < array[int+1] ? int += 1 : (return false)
  end
  
  true
end

def comb_sort(array)
  array = comb(array) until is_correct?(array)
  array
end

arr = [*1..20].shuffle
puts comb_sort(arr)
