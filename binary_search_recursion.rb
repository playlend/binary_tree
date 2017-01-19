arr = []
11.times do |num|
	num += 2
	arr.push(num)
end

def binary_search(arr, num)
	length = arr.length
	
	if length >= 0
		middle = length/2
		if arr[middle] > num
			return "#{num} was found" if arr[middle] == num
			arr = arr[0..middle-1]
			if middle != 0
				binary_search(arr,num)
			else
				"#{num} wasn't found"	
			end
		elsif arr[middle] <= num
			return "#{num} was found" if arr[middle] == num
			arr = arr[middle..-1]
			if middle != 0
				binary_search(arr,num)
			else
				"#{num} wasn't found"
			end
		end
	
	end
 	
end
p arr
p binary_search(arr, 2)



