list = [*1..100]
list.shuffle!

def qksort(arr)
  piv = arr.pop
  left, right = arr.partition{|x| x < piv}
  return (qksort(left) << piv) + qksort(right)
end

qksort(list)
