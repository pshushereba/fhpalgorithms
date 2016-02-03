class Image

	def initialize(image)
		@image = image
	end
	
	def output_image
		@image.each { |row| puts row.join }
	end 

  def transform
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