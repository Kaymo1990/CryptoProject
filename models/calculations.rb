class Calculations
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

    def standard_deviation(array)
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
end