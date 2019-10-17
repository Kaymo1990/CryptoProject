require 'calculations'

describe Calculations do
    describe '#mean' do
        it ' returns a mean value when passed an array of values' do
            expectedOutput = 3.0
            input = [1,2,3,4,5]
            expect(subject.mean(input)).to eq expectedOutput
        end
    end

    describe '#standard_deviation' do
        it 'returns a standard deviation from a range of values' do
            expectedOutput = 1.58
            input = [1,2,3,4,5]
            expect(subject.standard_deviation(input).round(2)).to eq expectedOutput
        end
    end

    describe '#coefficientOfVariation' do
        it 'returns a value that represents volatility' do
            expectedOutput = 0.53
            inputStandardDeviation = 1.58
            inputMean = 3
            expect(subject.coefficientOfVariation(inputStandardDeviation, inputMean)).to eq expectedOutput
        end
    end

    describe '#isVolatile' do
        it 'returns true when above a benchmark' do
            expectedOutput = true
            input = 0.31
            expect(subject.isVolatile(input)).to eq expectedOutput
        end

        it 'returns false when below a benchmark' do
            expectedOutput = false
            input = 0.29
            expect(subject.isVolatile(input)).to eq expectedOutput
        end
    end
end
