class HomeController < ApplicationController
  def index
  end
  
  def data
    Image.delete_all
    Link.delete_all

    # begin 
      html = HTTParty.get('http://biandangnyc.com')
    #   rescue
    #   return
    # end

    url_regex = /<a .*?href.*?['"]([^'"]*)['"].*?>\w*<\/a>/m
    image_regex = /<img .* src=[^'"]*['"].*?([^'"]*).*>/m
    urls = html.scan(url_regex)  #this is an array of all of the urls on the page
    urls.flatten!
    images = html.scan(image_regex)  #This is an array of all of the images on the page
    images.flatten!

    images.each do |image|
      i = Image.new
      i.url = image
      i.save
    end

    urls.each do |url|
      u = Link.new
      u.url = url
      u.save
    end
    # binding.pry
    render :json => Image.all
  end

  def show
    images = Image.all
    links = Link.all

  end
end
