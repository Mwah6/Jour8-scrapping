require 'nokogiri'
require 'open-uri'

# crypto_name_array = []
def dark_trader
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/#"))

  currency_array = Array.new
  # monnaie_nom = page.css("td.text-left.col-symbol")
  page.xpath("//td[3]").each do |currency|
    currency_array <<  currency.text
  end

  price_array = Array.new
  # monnaie_cours = page.css('td.no-wrap.text-right')
  page.xpath('//td[5]/a').each do |price|
    price_array << "%f" % price.text[1..-1].to_f # [1..-1] permet d'enlever le dollar
  end

  final_array = []
  for n in (0..currency_array.size-1) do
    final_array << { currency_array[n] => price_array[n]}
  end
  print final_array
  return final_array
end


dark_trader
