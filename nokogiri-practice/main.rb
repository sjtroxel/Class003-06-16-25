require "nokogiri"

doc = Nokogiri::HTML(File.open("index.html"))

doc.css("li").each { |li| puts li.text }