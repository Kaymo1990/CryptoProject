require 'uri'
require 'net/http'
require 'openssl'
require 'json'

class Crypto
    attr_accessor :dailyPrices
    def initialize
        @dailyPrices = []
    end

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

def coinPriceByDate(date)
url = URI("https://coingecko.p.rapidapi.com/coins/bitcoin/history?date=#{date}")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'coingecko.p.rapidapi.com'
request["x-rapidapi-key"] = '2e00d77e9bmshb4658adca133189p181bfejsnaa6ab9b43cc8'

response = http.request(request)
JSON.parse(response.read_body)["market_data"]["current_price"]["usd"]

end

def timeConversion
    Time.new.strftime("%d-%m-%Y")
end

def dateMap(days)
        oneDAY = 86400
        mappedDates = []
        dayCount = 0

        while dayCount < days 
            mappedDates << (Time.now - (oneDAY * dayCount)).strftime("%d-%m-%Y")
            dayCount+=1
        end

        return mappedDates
    end

    def movingAverage(days)
        mappedDates = self.dateMap(days)
        mappedDates.each do |date|
            self.dailyPrices << self.coinPriceByDate(date)
        end
        return self.dailyPrices       
    end

    def mean(array)
        array.inject(0) { |sum, x| sum += x } / array.size.to_f
    end

    def mean_and_standard_deviation(array)
        meanPrice = mean(array)
        variance = array.inject(0) { |variance, x| variance += (x - meanPrice) ** 2 }
        standardDeviation = Math.sqrt(variance/(array.size-1))
        return standardDeviation
      end

      def coefficientOfVariation(standardDeviation, mean)
        return (standardDeviation.to_f / mean.to_f).round(2)
      end

      def Volatile?(coefficientOfVariation, volatilityBenchmark = 0.30)
        if coefficientOfVariation <= volatilityBenchmark
            return true
        else
            return false
        end
      end

      def tradeRecommendationStatements(value, volatility = 0, mean = 0, volatilityBenchmark = 0.30, coin="BTC", movingAverage=200 )
        case value
        when "highvolatility"
            "There is a high volatility of #{volatility} compared to the benchmark of #{volatilityBenchmark}.
            This implies the price has fluctuated a lot in the past week - be cautious for extreme price swings. "
        when "lowvolatility"
            "There is a low volatility of #{volatility} compared to the benchmark of #{volatilityBenchmark}.
            This implies the price has stayed relatively stable, a sign of support! "
        when "aboveaverage"
            "The current price of #{coin} is above the #{movingAverage} day moving average.
            This means it is trading above what it has historically traded at. "
        else
            "No additional data. "
        end
      end
end