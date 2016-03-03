class Image

	def initialize(image)
		@image = image
	end
	
	#Iterate through @image input and identify which indices have a "1".
	
	def identify
		one_index = []
	  	@image.each_with_index do |row, row_index|
	  		row.each_with_index do |pixel, col_index|
	  			if pixel == 1
	  				one_index.push([row_index, col_index])
	  			end
		 	end
	  	end
			return one_index
	 end
	
	def transform(one_index)
	# Iterate through array of "1" pixel locations and pass those values to the update_cell method.
	one_index.each do |row_index, col_index|
		update_cell(row_index+1,col_index,1)
		update_cell(row_index,col_index+1,1)
		update_cell(row_index,col_index-1,1)
		update_cell(row_index-1,col_index,1)
	end
    	return Image.new(@image)
	end
	
	# The blur method take the row_index and col_index as arguments and passes them to the 
	# update_cell method along with a vaule to set the identified pixels to, causing the blur.
	
	def blur(n)
		n.times do
			transform(one_index)
		end
#		update_cell(row_index+1,col_index,1)
#		update_cell(row_index,col_index+1,1)
#		update_cell(row_index,col_index-1,1)
#		update_cell(row_index-1,col_index,1)
	end
	
	# update_cell sets the values passed into it to "1", but only after checking to see if the 	# selected indices are within the bounds of the array.
	
	def update_cell(row_index, col_index, value)
		return if !within?(@image, row_index) || !within?(@image[row_index],col_index)
		@image[row_index][col_index] = value
	end
	
	# The within? method is used in conjunction with the update_cell method in order to make 
	# sure that the indices being updated are within the bounds of the image input.
	def within?(array,index)
		array.size > index && index >= 0
	end1
	
	def output_image
		@image.each { |row| puts row.join }
	end 

end
end

#First "1" in @image [1][1]

# Indicies that need to be changed for blur to be complete
#@image[0][1]
#@image[1][0]
#@image[1][2]
#@image[2][1]

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
#image.output_image

afterImage = image.identify
afterImage.blur(2)

# afterImage = Image.new([
#   [0, 1, 0, 0],
#   [1, 1, 1, 1],
#   [0, 1, 1, 1],
#   [0, 0, 0, 1]
# ])