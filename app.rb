require 'sinatra'
require_relative './lib/simplecrypto.rb'
require_relative './lib/crypto.rb'

class CryptoMain < Sinatra::Base
get '/' do
    erb :index
end

get '/cryptosearch' do
    erb :cryptosearch
end

post '/cryptosearch' do
    p params
     @coin = SimpleCrypto.new(params[:coin])
     @search = Crypto.new
        if @search.coinPriceByDate(params[:coin], Time.new.strftime("%d-%m-%Y")) == "error"
            erb :error
        else
            @coin.getCryptoPricesFor100days
            @analysis = @coin.analysisReport
            erb :analysis
        end
     end

# run! if app_file == $0
end