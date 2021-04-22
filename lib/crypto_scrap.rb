
require 'rubygems'
require 'nokogiri'
require 'open-uri'
   

def crypto_scrapper
    

    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    crypto_name = []
    page.xpath('//td[2]').each do |element|
        crypto_name << element.text
    end

    crypto_price = []
    page.xpath('//td[5]').each do |element|
        crypto_price << element.text
    end

    crypto_value_array = []
    i = 0

    begin 
        while crypto_name[i] != nil do 
            crypto_value_array << Hash[crypto_name[i],crypto_price[i]]
            i +=1
        end
    rescue => e 
        puts "no error"
    end 
    return crypto_value_array
    
end

crypto_scrapper



