require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Crypto

    def coinSearch(currency, coin)

        url = URI("https://bravenewcoin-v1.p.rapidapi.com/ticker?show=#{currency}&coin=#{coin}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'bravenewcoin-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '2e00d77e9bmshb4658adca133189p181bfejsnaa6ab9b43cc8'

        response = http.request(request)
        return JSON.parse(response.read_body)
    end

    def coinPriceByDate(coin, date)
        url = URI("https://coingecko.p.rapidapi.com/coins/#{coin}/history?date=#{date}")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'coingecko.p.rapidapi.com'
        request["x-rapidapi-key"] = '2c19478a9dmsh82b87dc0ef20995p129153jsnad6290d366b5'

        response = http.request(request)
        return JSON.parse(response.read_body)["market_data"]["current_price"]["usd"]

        rescue => e
            "error"
    end
end