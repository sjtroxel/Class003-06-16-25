require "nokogiri"
require "httparty"

class API
  def self.get_films_by_year(year)
    url = "https://en.wikipedia.org/wiki/#{year}_in_film"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page.body)
    
    # extract the elements as nokogiri instances
    films = parsed_page.css("table.wikitable.sortable tr td:nth-child(2) i a").map { |film| film.text.strip }

    # now we iterate over the films and print them to the terminal
    films.each_with_index do |film, index|
     puts "#{index + 1}. #{film}"
    end
  end
end

API.get_films_by_year(2019)
API.get_films_by_year(2005)