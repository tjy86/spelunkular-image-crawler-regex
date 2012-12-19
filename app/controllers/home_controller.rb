class HomeController < ApplicationController
  def index
  end


  def data
    Image.delete_all
    Link.delete_all

    depth = params[:depth].to_i

    url_regex = /<a .*?href.*?['"]([^'"]*)['"].*?>\w*<\/a>/m
    image_regex = /<img .*?src.*?['"]([^'"]*)['"].*?>/m

    Link.create(:url => params[:url], :depth => 0)

    urls = nil

    i = 0

    while (i < depth)

      links = Link.where(:depth => i)

      links.each do |link|
          html = HTTParty.get(link.url)

          urls = html.scan(url_regex)  #this is an array of all of the urls on the page
          urls.flatten!

          images = html.scan(image_regex)  #This is an array of all of the images on the page
          images.flatten!

          images.each do |image|
            if URI.parse(image).relative?
              image = params[:url] +image
            end
            i = Image.new
            i.url = image
            i.save
          end
      end

      i =+ 1

      urls.each do |url|
        if URI.parse(url).relative?
          url = params[:url] + url
        end
        u = Link.new
        u.url = url
        u.depth = i
        u.save
      end
    end

    render :json => Image.all

  end

end
