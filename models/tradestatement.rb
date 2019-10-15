class TradeStatement
    
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
        when "belowaverage"
            "The current price of #{coin} is below the #{movingAverage} day moving average.
            This means it is trading below what it has historically traded at. "
        else
            "No additional data. "
        end
      end

      def tradeRecommendation (dailyPrices = self.dailyPrices, coin, movingAverage, )
      end
end