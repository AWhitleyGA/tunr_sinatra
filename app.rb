require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative "db/connection"
require_relative "models/artist"
require_relative "models/song"


get '/artists' do
  @artists = Artist.all.order(:id)
  erb :"artists/index"
end

get '/songs' do
  @songs = Song.all
  erb :"songs/index"
end

get '/artists/new' do
  erb :"artists/new"
end

post '/artists' do
  @artist = Artist.create(
    name: params[:name],
    nationality: params[:nationality],
    photo_url: params[:photo_url]
  )
  redirect "/artists/#{@artist.id}"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
  @photo = @artist.photo_url
  erb :"artists/show"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

put '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.update(name: params[:name],
    nationality: params[:nationality],
    photo_url: params[:photo_url]
    )
  redirect "/artists/#{@artist.id}"
end

delete "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect "/artists"
end
