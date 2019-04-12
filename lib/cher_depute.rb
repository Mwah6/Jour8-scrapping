require 'nokogiri'
require 'open-uri'

def get_connection(url)
  page = nil
  page = Nokogiri::HTML(open(url))
  if page != nil
    return page
  else
    puts "Erreur de connexion (url incorrect ?)"
    exit 1
  end
end

def print_arr(arr)
  arr.each{|n|
    puts n
  }
    puts arr.length
end

def get_deputes
  url_source = 'http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'
  page = get_connection(url_source) # Une fonction pour se connecter, tu lui envoie le lien (String)
  div_container = page.xpath('//*[@id="deputes-list"]')
  link_array = div_container.css('div#deputes-list ul li a')

  first_name_array = Array.new
  last_names_array = Array.new
  deputy_link_array = Array.new
  deputy_mail_array = Array.new
  final_array = Array.new

  splitted_name = Array.new
  link_array.each {|link|
    splitted_full_name = link.text.split(" ")
    first_name_array << splitted_full_name[1]
    last_names_array << splitted_full_name[2..-1].join(" ")
    deputy_link_array << URI.join('http://www2.assemblee-nationale.fr/', link['href'])
  }
  
  # puts "Debut deputy_link_array"
  deputy_link_array.each{|link|
    begin
      profil_page = Nokogiri::HTML(open(link))
    rescue
      puts "J'ai bien peur que ce lien ne soit pas valide"
      next
    end
    # info = profil_page.xpath('//*[@class="deputes-liste-attributs"]')

    # info = profil_page.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl')
    mail_bal = profil_page.xpath('/html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a')
    # mail_deputy = info.css('a[href*="mailto:"]')
    # print  " ", mail_deputy.text, "\n"
    # print mail_bal.text, "\n"
    deputy_mail_array << mail_bal.text
    # puts mail_depute
  }
  # print_arr(email)
  # /html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a
  # /html/body/div[3]/div/div/div/section[1]/div/article/div[3]
# /html/body/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl
  n = 0
  first_name_array.each do |cell|
    final_array << {"first_name" => cell, "last_name" => last_names_array[n], "email" => deputy_mail_array[0] }
    n += 1
  end
  puts final_array[0], final_array[1], final_array[2], final_array[3] #Pour montrer
  return final_array
end

def perform
  get_deputes
end
