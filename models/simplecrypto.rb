require_relative 'datemap.rb'
require_relative 'calculations.rb'

class SimpleCrypto
attr_accessor :daily_prices_historically
    def initialize
        @daily_prices_historically = []
    end

    def getCryptoPricesFor100days(coin="bitcoin", currency="usd", dateParser = DateMap.new, technicalCalc = Calculations.new)
        mapped_dates = dateParser.dateMap(10)
        self.daily_prices_historically = technicalCalc.movingAverage(mapped_dates)
    end
end