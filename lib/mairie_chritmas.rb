require 'nokogiri'
require 'open-uri'


# def listedescommunes
#   page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
#   list_villes = []
#   val_doise = page2.css("a.lientxt")
#   val_doise.each do |ville|
#     list_villes << ville.text #remplit le tableau plus précis avec le nouveau css plus petit
#   end
#   puts list_villes
# end


 def get_city
   city_array = []
   city_array = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")).css("a.lientxt")
 end

def get_townhall_urls (city_array)
  city_townhall_urls = []
  city_array.each do |ville|
    city_townhall_urls << "http://annuaire-des-mairies.com/95/#{ville.text.downcase.gsub(" ", "-")}.html" #remplit le tableau plus précis avec le nouveau css plus petit
  end
  puts city_townhall_urls
  return city_townhall_urls
end

def get_townhall_email(townhall_url)
  townhall_email_array= []
  townhall_url.each do |url|
    townhall_email_array <<  Nokogiri::HTML(open(url)).css("td")[7].text
  end
  # puts townhall_email_array
  # puts townhall_email_array.size
end

def formulemagique city_array townhall_email_array
final_array = []
for n in (0..city_array.size-1) do
  final_array << { city_array[n] => townhall_email_array[n]}
end
print final_array
return final_array
end



formulemagique ((get_townhall_email get_townhall_urls get_city) ; get_city)
