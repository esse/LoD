require 'bundler/setup'
require 'sinatra'

require_relative 'example.rb'

get '/' do
  
end

get '/:id' do
  UserRepository.find(params[:id].to_i).as_json
end