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
            "The current price of #{coin} is above the 100 day moving average.
            This means it is trading above what it has historically traded at. "
        when "belowaverage"
            "The current price of #{coin} is below the 100 day moving average.
            This means it is trading below what it has historically traded at. "
        else
            "No additional data. "
        end
    end

    def tradeRecommendation (dailyPrices, standardDeviation, mean, coefficientOfVariation, isVolatile, coin="bitcoin" )
        crypto_trader_statement = "The current price of #{coin} is #{dailyPrices[0]}. "

        if dailyPrices[0] >= mean
            crypto_trader_statement += tradeRecommendationStatements("aboveaverage")
        else
            crypto_trader_statement += tradeRecommendationStatements("belowaverage")
        end

        if isVolatile == true
            crypto_trader_statement += tradeRecommendationStatements("highvolatility")
        else
            crypto_trader_statement += tradeRecommendationStatements("lowvolatility")
        end

        return crypto_trader_statement
    end
end