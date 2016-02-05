class Image

	def initialize(image)
		@image = image
	end
	
	def output_image
		@image.each { |row| puts row.join }
		#transform.each { |row_index, col_index| blur(row_index, col_index) }
	end 
	
#	def blur(x,y)
#		@image[x][y] =
#		[x][y-1]
#		[x+1][y]
#	end

  def transform
	one_index = []
  	@image.each_with_index do |row, row_index|
  		row.each_with_index do |pixel, col_index|
  			if pixel == 1
  				one_index.push([row_index, col_index])
  			end
  		end
  	end
	print one_index
    #return Image.new(@image)
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
#afterImage.output_image

# afterImage = Image.new([
#   [0, 1, 0, 0],
#   [1, 1, 1, 1],
#   [0, 1, 1, 1],
#   [0, 0, 0, 1]
# ])