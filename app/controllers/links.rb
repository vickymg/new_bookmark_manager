class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    if session[:user_id]
      link = Link.create(title: params[:title],url: params[:url])
      params[:tags].split(', ').each do |tag|
        link.tags << Tag.create(name: tag)
      end
      link.save
      redirect to('/links')
    else
      flash.keep[:notice] = 'Please sign in to add a link!'
      redirect to '/sessions/new'
    end
  end

end
