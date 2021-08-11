require   'nokogiri'
require   'open-uri'
require   'json'

task :open_door do
  puts "open"
end

task :close_door => :open_door do
  puts "close"
end

task :goto_toilet => :close_door do
  puts "......."
end

def upadate_restaurants
  # Fetch and parse HTML document
  data = Nokogiri::HTML(URI.open('https://guide.michelin.com/tw/zh_TW/taipei-region/taipei/restaurants/1-star-michelin'))

  # Search for nodes by css
  restaurants = data.css('.card__menu-content a').map do |d|
    {
      name: d.content.strip,
      link: "https://guide.michelin.com#{d['href']}"
    }
  end

  r = File.new(Rails.root.join('public', 'result.json'), 'w')
  r.write(restaurants.to_json)
  r.close
end

namespace :restaurants do
  desc '更新'
  task :update => :environment do
    # p Restaurant.all
    upadate_restaurants
  end
end



