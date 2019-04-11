require 'rubygems'
require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))



noms_deputes = []
page.css("div#deputes-list li a").each do | depute |
  noms_deputes << depute.text
end

first_names = Array.new
last_names = Array.new
email_array = Array.new
noms_deputes.each do | depute |
  first_names << depute.split[1]
  last_names << depute.split[2..-1].join(" ")
  email_array << "#{depute.split[1].downcase.unicode_normalize(:nfkd)}.#{depute.split[2..-1].join("-").downcase}@assemblee-nationale.fr"
end
puts email_array
