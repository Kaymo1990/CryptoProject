require 'uri'
require 'net/http'
require 'openssl'
require 'json'


def coinSearch(currency, coin)

url = URI("https://bravenewcoin-v1.p.rapidapi.com/ticker?show=#{currency}&coin=#{coin}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'bravenewcoin-v1.p.rapidapi.com'
request["x-rapidapi-key"] = '2e00d77e9bmshb4658adca133189p181bfejsnaa6ab9b43cc8'

response = http.request(request)
JSON.parse(response.read_body)
end