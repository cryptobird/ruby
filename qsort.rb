require 'byebug'

list = [*1..100]
list.shuffle!

def qksort(arr)
  piv = arr.pop
byebug
  left, right = arr.partition{|x| x < piv}
  return (qksort(left) << piv) + qksort(right)
end

qksort(list)


nil