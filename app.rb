#require "pry"
require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

get "/" do
  @resto_count = Restaurant.count
  @restaurants = Restaurant.all
  erb :index
end

get '/restaurants/:id' do
  #binding.pry
  @restaurant = Restaurant.find(params[:id])
  erb :show
end

post '/restaurants' do
  #binding.pry
  name = params[:name]
  address = params[:address]
  restaurant = Restaurant.new(name: name, address: address)
  restaurant.save
  redirect "/"
end

