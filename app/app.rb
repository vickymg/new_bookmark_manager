ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title],
                    url: params[:url])
                    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    redirect to('/links')
  end

end
