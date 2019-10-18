require_relative 'datemap.rb'
require_relative 'calculations.rb'
require_relative 'tradestatement.rb'

class SimpleCrypto
attr_accessor :daily_prices_historically, :standard_deviation_100d, :mean_100d, :coefficient_of_variation, :is_volatile, :coin
    def initialize(coin)
        @coin = coin
        @daily_prices_historically = []
        @standard_deviation_100d = []
        @mean_100d
        @coefficient_of_variation = 0
        @is_volatile = false
        @final_report
    end

    def getCryptoPricesFor100days(coin: self.coin, currency: "usd", dateParser: DateMap.new, technicalCalc: Calculations.new)
        mapped_dates = dateParser.dateMap(2)
        self.daily_prices_historically = technicalCalc.movingAverage(mapped_dates, coin)
        self.mean_100d = technicalCalc.mean(self.daily_prices_historically)
        self.standard_deviation_100d = technicalCalc.standard_deviation(daily_prices_historically)
        self.coefficient_of_variation = technicalCalc.coefficientOfVariation(self.standard_deviation_100d, self.mean_100d)
        self.is_volatile = technicalCalc.isVolatile(self.coefficient_of_variation)
        return "Data has been successfully acquired."
    end

    def analysisReport(tradeStatementPrinter = TradeStatement.new)
        tradeStatementPrinter.tradeRecommendation(self.daily_prices_historically, self.standard_deviation_100d, self.mean_100d, self.coefficient_of_variation, self.is_volatile, self.coin)
    end


end