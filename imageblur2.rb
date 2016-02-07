class Image

	def initialize(image)
		@image = image
	end
	
	def output_image
		@image.each { |row| puts row.join }
		transform.each { |row_index, col_index| blur(row_index, col_index) }
	end 
	
	def blur(row_index,col_index)
		@image[row_index-1][col_index] = 1
		@image[row_index][col_index-1] = 1
		@image[row_index][col_index+1] = 1
		@image[row_index+1][col_index] = 1
	end

#First "1" in @image [1][1]

# Indicies that need to be changed for blur to be complete
#@image[0][1]
#@image[1][0]
#@image[1][2]
#@image[2][1]

  def transform
	one_index = []
  	@image.each_with_index do |row, row_index|
  		row.each_with_index do |pixel, col_index|
  			if pixel == 1
  				one_index.push([row_index, col_index])
				#puts blur(row_index, col_index)
  			end
  		end
  	end
	print one_index
    return Image.new(@image)
  end

end

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