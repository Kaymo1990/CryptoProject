require 'spec_helper'

feature 'coingecko api request' do
  it 'queries bitcoin price via coingecko' do

    stub_request(:get, "https://coingecko.p.rapidapi.com/coins/bitcoin/history?date=20-10-2019").      
    with(
      headers: {
     'Accept'=>'*/*',
     'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
     'Host'=>'coingecko.p.rapidapi.com',
     'User-Agent'=>'Ruby'
      }).
    to_return(status: 200, body: "", headers: {})

    uri = URI("https://coingecko.p.rapidapi.com/coins/bitcoin/history?date=20-10-2019")
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end