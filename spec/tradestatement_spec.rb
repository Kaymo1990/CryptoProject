require 'tradestatement'

describe TradeStatement do
    describe '#tradeRecommendationStatements' do
        it 'should return a statement indicating high volatility' do
            expectedOutput = "There is a high volatility of 0 compared to the benchmark of 0.3.
            This implies the price has fluctuated a lot in the past week - be cautious for extreme price swings. "
            input = "highvolatility"
            expect(subject.tradeRecommendationStatements(input)).to eq expectedOutput
        end

        it 'should return a statement indicating low volatility' do
            expectedOutput =  "There is a low volatility of 0 compared to the benchmark of 0.3.
            This implies the price has stayed relatively stable, a sign of support! "
            input = "lowvolatility"
            expect(subject.tradeRecommendationStatements(input)).to eq expectedOutput
        end

        it 'should return a statement indicating low volatility' do
            expectedOutput =  "There is a low volatility of 0 compared to the benchmark of 0.3.
            This implies the price has stayed relatively stable, a sign of support! "
            input = "lowvolatility"
            expect(subject.tradeRecommendationStatements(input)).to eq expectedOutput
        end

    end
end