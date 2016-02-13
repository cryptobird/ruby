def qksort(arr)
  if arr.nil? || arr.empty? then [] else
    piv = arr.pop
    left, right = arr.partition{|x| x < piv}
    return (qksort(left) << piv) + qksort(right)
  end
end

list = [*1..100]
list.shuffle!
puts list
puts qksort(list)


nil
