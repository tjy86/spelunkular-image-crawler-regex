require 'test_helper'
require 'rails/performance_test_help'

class HomepageTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def test_homepage
    get '/'
  end

  def test_scrape_web_1_level_deep
    post '/', :url => 'http://apple.com', :depth => '1'
  end

  def test_scrape_web_2_level_deep
    post '/', :url => 'http://apple.com', :depth => '2'
  end

  def test_scrape_web_3_level_deep
    post '/', :url => 'http://apple.com', :depth => '3'
  end
end
