class Image

	def initialize(image)
		@image = image
	end
	
	def output_image
		@image.each do |x|
			x.join
		end
	end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
puts image.output_image