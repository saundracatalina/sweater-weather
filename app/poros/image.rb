class Image
  attr_reader :image,
              :credit

  def initialize(data, location)
    @image = {
              image_url: data[:results][0][:urls][:raw] || 'nil',
              location: location
            }
    @credit = {
                source: "unsplash.com",
                author: data[:results][0][:user][:links][:self] || 'nil'
              }
  end
end
