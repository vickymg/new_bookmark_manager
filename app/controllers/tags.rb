class BookmarkManager < Sinatra::Base

  get '/tags/:name' do
    tag = Tag.all(name: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

end
