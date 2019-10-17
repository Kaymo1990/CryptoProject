require_relative 'datemap.rb'
require_relative 'calculations.rb'
require_relative 'tradestatement.rb'

class SimpleCrypto
attr_accessor :daily_prices_historically, :standard_deviation_100d, :mean_100d, :coefficient_of_variation, :is_volatile
    def initialize
        @daily_prices_historically = []
        @standard_deviation_100d = []
        @mean_100d
        @coefficient_of_variation = 0
        @is_volatile = false
        @final_report
    end

    def getCryptoPricesFor100days(coin="bitcoin", currency="usd", dateParser = DateMap.new, technicalCalc = Calculations.new)
        mapped_dates = dateParser.dateMap(10)
        self.daily_prices_historically = technicalCalc.movingAverage(mapped_dates)
        self.mean_100d = technicalCalc.mean(self.daily_prices_historically)
        self.standard_deviation_100d = technicalCalc.standard_deviation(daily_prices_historically)
        self.coefficient_of_variation = technicalCalc.coefficientOfVariation(self.standard_deviation_100d, self.mean_100d)
        self.is_volatile = technicalCalc.isVolatile(self.coefficient_of_variation)
    end

    def analysisReport(tradeStatementPrinter = TradeStatement.new)
        tradeStatementPrinter
    end


end