
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    "Hello world!"
  end 

  get '/articles' do
    @articles = Article.all
    erb :index
  end 

  post '/articles' do
    @title = params[:title]
    @content = params[:content]
    new_a = Article.create(title: @title, content: @content)

    redirect "/articles/#{new_a.id}"
  end

  get '/articles/new' do

    erb :new

  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do 
    @article = Article.find(params[:id])
    erb :edit
  end

end
