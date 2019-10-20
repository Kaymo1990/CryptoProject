require 'sinatra'
require_relative './lib/simplecrypto.rb'

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
     if @coin.getCryptoPricesFor100days != NoMethodError
        @analysis = @coin.analysisReport
        erb :analysis
     else
        erb :index
     end
end

# run! if app_file == $0
end