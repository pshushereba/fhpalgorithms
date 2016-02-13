class Image

	def initialize(image)
		@image = image
	end
	
	#Iterate through @image input and identify which indices have a "1".
	
	def transform
		one_index = []
	  	@image.each_with_index do |row, row_index|
	  		row.each_with_index do |pixel, col_index|
	  			if pixel == 1
	  				one_index.push([row_index, col_index])
	  			end
		 	end
	  	end
			
		# Iterate through array of "1" pixel locations and pass those values to the blur method.
		
		one_index.each do |row_index, col_index|
			blur(row_index,col_index)
		end

	    return Image.new(@image)
	 end
	
	def blur(row_index,col_index)
	
#		@image[row_index-1][col_index] = 1
#		@image[row_index][col_index-1] = 1
#		@image[row_index][col_index+1] = 1
#		@image[row_index+1][col_index] = 1

		update_cell(row_index+1,col_index,1)
		update_cell(row_index,col_index+1,1)
		update_cell(row_index,col_index-1,1)
		update_cell(row_index-1,col_index,1)
	end
	
	def update_cell(row_index, col_index, value)
		return if !within?(@image, row_index) || !within?(@image[row_index],col_index)
		@image[row_index][col_index]  = value
	end
	
	def within?(array,index)
		array.size > index && index >= 0
	end
	
	def output_image
		@image.each { |row| puts row.join }
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

afterImage = image.transform
afterImage.output_image

# afterImage = Image.new([
#   [0, 1, 0, 0],
#   [1, 1, 1, 1],
#   [0, 1, 1, 1],
#   [0, 0, 0, 1]
# ])