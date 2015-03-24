module UrlParser

  def self.parse(url)
    response = Excon.get(url, omit_default_port: true)
    if response.status == 200
      images = []
      page = Nokogiri::HTML(response.body)

      title = page.css('title').children.text.strip
      first_p = page.css('body p').children.text
      _images = page.css('img')
      _images.each do |img|
        images << img.attributes['src'].value
      end

      return title, first_p, images
    else
      response.status
    end

  end

end
