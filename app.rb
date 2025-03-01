require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @medicines = Medicine.all
  erb:index
end

get '/item/create' do
  erb :new
end

post '/item/create' do
  Medicine.create(name: params[:name], stock: params[:stock])
  redirect '/'
end

get "/item/:id" do
  @item = Medicine.find(params[:id])
  erb :item
end

post "/item/:id" do
  @item = Medicine.find(params[:id])
  @item.update(
    name: params[:name],
    stock: params[:count]
  )
  redirect "/"
end

get "/item/:id/delete" do
  @item = Medicine.find(params[:id])
  @item.delete
  redirect "/"
end


