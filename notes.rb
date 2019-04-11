# Some recursive problems of increasing difficulty to illustrate foundational concepts

# 1 - one_dimensional?(arr) - will return true or false depending on if an array is
# one dimensional
# one_dimensional?([1,2,3]) => true
# one_dimensioanl?([1,2,[1,2,3]]) => false

# How could we write this?
# An empty array is one dimensional | OUR BASE CASE |
# If the first element of the array is an array, the array is not one dimensional 

def one_dimensional?(arr)
  return true if arr.empty?
  return false if arr.first.is_a?(Array)
  
  one_dimensional?(arr[1..-1])
end

# 2 - member?(arr, el) - this will return true if arr includes el, false if it does not
# member?([1,2,3], 1) => true
# member?([1,2,3], 4) => false

# If the array is empty, it does not contain el and should return false
# If the first element in the array == el, arr clearly contains el and should return true

def member?(arr, el)
  return false if arr.empty?
  return true if arr.first == el

  member?(arr[1..-1], el)
end


# 3 - remove_first(arr,el) Remove first occurence of an element
# If the first element of the array is the element, return the remainder of the array
# without the first element (arr[1..-1])
# Otherwise, return the recursive call on the rest of the array concatenated onto the first element
# remove_first([1,1,2,3], 1) => [1,2,3]
# remove_first([1,2,3,4,3], 3) => [1,2,4,3]

def remove_first(arr, el)
  return arr if arr.empty?
  if arr.first == el
    return arr[1..-1]
  else 
    return [arr.first].concat(remove_first(arr[1..-1], el))
  end 
end 

# 4 - remove_all(arr, el) 
# remove_all([1,2,3,3,3], 3) => [1,2]
# remove_all([1,2,3,4,5], 9) => [1,2,3,4,5]

# if the array is empty, return an empty array
# if the first element equals el, return remove_all called on the rest of the array
# otherwise, return remove_all called on the rest of the array concatenated to the first element

def remove_all(arr, el)
  return arr if arr.empty?
  if arr.first == el
    return remove_all(arr[1..-1], el)
  else 
    return [arr.first].concat(remove_all(arr[1..-1], el)) 
  end 
end

# 5 - remove_all_with_proc(arr, &prc)
# remove_all([1,2,3,4]) {|e| e % 2 == 0} => [1,3] 
# return the array if it is empty
# if the first element of the array satisfies the proc,
# return remove_all_with_proc called on the rest of the array
# otherwise, return remove_all_with_proc called on the rest of the array
# concatenated onto the front

def remove_all_with_proc(arr, &prc)
  return arr if arr.empty?
  if prc.call(arr.first)
    return remove_all_with_proc(arr[1..-1], &prc)
  else 
    [arr.first].concat(remove_all_with_proc(arr[1..-1], &prc))
  end 
end 

