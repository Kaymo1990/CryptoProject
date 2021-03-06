require_relative 'crypto.rb'

class Calculations

    def movingAverage(mappedDates, coin = "bitcoin", cryptoAPI = Crypto.new)
        daily_prices = []
        mappedDates.each do |date|
            daily_prices << cryptoAPI.coinPriceByDate(coin, date)
    end
         return daily_prices       
    end

    def mean(array)
        array.inject(0) { |sum, x| sum += x } / array.size.to_f
    end

    def standard_deviation(array)
        meanPrice = mean(array)
        variance = array.inject(0) { |variance, x| variance += (x - meanPrice) ** 2 }
        standardDeviation = Math.sqrt(variance/(array.size-1))
        return standardDeviation
    end

    def coefficientOfVariation(standardDeviation, mean)
        return (standardDeviation.to_f / mean.to_f).round(3)
    end

    def isVolatile(coefficientOfVariation, volatilityBenchmark = 0.03)
        if coefficientOfVariation >= volatilityBenchmark
            return true
        else
            return false
        end
    end

end