require "nokogiri"

doc = Nokogiri::HTML(File.open("index.html"))

puts doc.css("h1").text