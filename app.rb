require 'bundler/setup'
require 'sinatra'

require_relative 'example.rb'

get '/' do
  UserRepository.all_ids.map do |id|
    %Q(<a href="/#{id}">#{id}</a><br />)
  end
end

get '/:id' do
  UserSerializer.new(UserRepository.find(params[:id].to_i)).to_json
end
