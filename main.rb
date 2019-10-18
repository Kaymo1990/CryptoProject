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
     @coin.getCryptoPricesFor100days
     erb :analysis
end

run! if app_file == $0
end