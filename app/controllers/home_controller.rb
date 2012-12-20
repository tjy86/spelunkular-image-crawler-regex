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
        begin
          html = HTTParty.get(link.url)
        rescue
        end

        images = html.scan(image_regex)  #This is an array of all of the images on the page
        images.flatten!

        images.each do |image|
          image = params[:url] + image if URI.parse(image).relative?
          a = Image.new
          a.url = image
          a.save
        end

        j = i + 1

        urls = html.scan(url_regex)  #this is an array of all of the urls on the page
        urls.flatten!

        urls.each do |url|
          begin
            url = params[:url] + url if URI.parse(url).relative?
            u = Link.new
            u.url = url
            u.depth = j
            u.save
          rescue
          end
        end

      end
      i += 1
    end
    render :json => Image.all
  end
end


